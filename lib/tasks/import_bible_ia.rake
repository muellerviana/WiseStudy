require "openai"

namespace :import do
  desc "Import Bible books, chapters, verses, and words from JSON with GPT-5 enrichment (original + translation only)"
  task :bible_ai => :environment do
    file_path = Rails.root.join("db/data/bible_export.json")
    data = JSON.parse(File.read(file_path))

    client = OpenAI::Client.new

    puts "📖 Starting light GPT-5 Bible import..."

    books_cache = {}
    chapters_cache = {}

    # Helper: enrich a word with verse context using GPT-5 (original + translation only)
    def get_openai_word_light(client, word, verse_text, reference)
      return { original: word, translation: nil } if word.to_s.strip.empty?

      prompt = <<~PROMPT
        You are a biblical language expert. For the Greek word "#{word}" in the verse "#{verse_text}" (#{reference}), return a JSON object with keys:

        - original: the original word with proper accentuation
        - translation: a single, concise biblical translation in Portuguese, following João Ferreira de Almeida style, specific to the context of this verse.

        Important instructions:
        1. Do **not translate proper names**; preserve them exactly as in JFA.
        2. Translate only common biblical words, concepts, or titles.
        3. Always return **only one translation**, using the verse context.
        4. Output must be valid JSON with exactly the keys: original, translation.
        5. Keep Portuguese translations simple and clear.
      PROMPT

      begin
        response = client.responses.create(
          model: "gpt-5",
          input: prompt
        )

        text = response.output_text
        JSON.parse(text, symbolize_names: true) rescue { original: word, translation: nil }
      rescue => e
        puts "⚠️ OpenAI error for word '#{word}' in verse '#{reference}': #{e.message}"
        { original: word, translation: nil }
      end
    end

    data.each do |book_data|
      book_name = book_data['name'] || book_data['book_name'] || "Book #{book_data['id'] || 'unknown'}"
      testament = book_data['testament']

      puts "Book: #{book_name} (#{testament})"
      STDOUT.flush

      book = books_cache[book_name] ||= BibleBook.find_or_create_by!(name: book_name) do |b|
        b.testament = testament if b.respond_to?(:testament=)
      end

      if book.respond_to?(:testament=) && book.testament != testament
        book.update!(testament: testament)
      end

      (book_data['chapters'] || []).each do |ch_data|
        chapter_num = ch_data['number'].to_i
        chapter_key = "#{book.id}:#{chapter_num}"
        chapter = chapters_cache[chapter_key] ||= Chapter.find_or_create_by!(bible_book: book, number: chapter_num)

        (ch_data['verses'] || []).each do |vs_data|
          verse_num = vs_data['number'].to_i

          verse_text = if vs_data.key?('text') && vs_data['text']
                         vs_data['text']
                       elsif vs_data['words'].is_a?(Array)
                         vs_data['words'].map { |w| w['original'].to_s }.reject(&:empty?).join(' ')
                       else
                         nil
                       end

          reference = "#{book_name} #{chapter_num}:#{verse_num}"
          puts "  Saving: #{reference}"
          STDOUT.flush

          verse = Verse.find_or_initialize_by(chapter: chapter, number: verse_num)
          verse.text = verse_text if verse.respond_to?(:text=) && verse_text
          verse.save! if verse.changed? || verse.new_record?

          verse.words.destroy_all if verse.respond_to?(:words)

          if vs_data['words'].is_a?(Array)
            vs_data['words'].each_with_index do |w_data, idx|
              enrichment = get_openai_word_light(
                client,
                w_data['original'],
                verse_text,
                reference
              )

              Word.create!(
                verse: verse,
                position: (w_data['position'] || idx + 1),
                original: enrichment[:original],
                translation: enrichment[:translation]
              )
            end
          end
        end
      end
    end

    puts "✅ Light GPT-5 Bible import completed successfully!"
  end
end
