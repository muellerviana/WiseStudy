namespace :import do
  desc "Import Bible books, chapters, verses, and words from JSON (ignores timestamps)"
  task :bible => :environment do
    file_path = Rails.root.join("db/data/bible_export.json")
    data = JSON.parse(File.read(file_path))

    puts "📖 Starting Bible import..."

    books_cache = {}
    chapters_cache = {}

    ActiveRecord::Base.transaction do
      # The JSON is an array of books
      data.each do |book_data|
        book_name = book_data['name'] || book_data['book_name'] || "Book #{book_data['id'] || 'unknown'}"
        testament = book_data['testament']

        puts "Book: #{book_name} (#{testament})"

        book = books_cache[book_name] ||= BibleBook.find_or_create_by!(name: book_name) do |b|
          b.testament = testament if b.respond_to?(:testament=)
        end

        # ensure testament is set/updated
        if book.respond_to?(:testament=) && book.testament != testament
          book.update!(testament: testament)
        end

        (book_data['chapters'] || []).each do |ch_data|
          chapter_num = ch_data['number'].to_i
          chapter_key = "#{book.id}:#{chapter_num}"
          chapter = chapters_cache[chapter_key] ||= Chapter.find_or_create_by!(bible_book: book, number: chapter_num)

          (ch_data['verses'] || []).each do |vs_data|
            verse_num = vs_data['number'].to_i

            # Build verse text: prefer explicit text field, otherwise join word originals (if present)
            verse_text = if vs_data.key?('text') && vs_data['text']
                           vs_data['text']
                         elsif vs_data['words'].is_a?(Array)
                           vs_data['words'].map { |w| w['original'].to_s }.reject(&:empty?).join(' ')
                         else
                           nil
                         end

            puts "  Creating: #{book_name} #{chapter_num}:#{verse_num}"

            verse = Verse.find_or_initialize_by(chapter: chapter, number: verse_num)
            if verse.respond_to?(:text=) && verse_text
              verse.text = verse_text
            end
            verse.save! if verse.changed? || verse.new_record?

            # Remove previous words if re-importing
            verse.words.destroy_all if verse.respond_to?(:words)

            # Import words if present in JSON
            if vs_data['words'].is_a?(Array)
              vs_data['words'].each_with_index do |w_data, idx|
                Word.create!(
                  verse: verse,
                  position: (w_data['position'] || idx + 1),
                  original: w_data['original'],
                  transliteration: w_data['transliteration'],
                  strong_number: w_data['strong_number'],
                  translation: w_data['translation']
                )
              end
            end
          end
        end
      end
    end

    puts "✅ Import completed successfully!"
  end
end