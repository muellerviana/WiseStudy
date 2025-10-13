namespace :import do
  desc "Import Strong's entries from JSON without external gems"
  task strongs: :environment do
    file_path = Rails.root.join("db/data/lexicon-hebrew.json")
    data = JSON.parse(File.read(file_path))

    data.each do |strongs_number, html_content|
      # Helper to extract content between <p> or <strong> tags
      def extract_text(html, label)
        if html =~ /<p>#{label}:\s*<strong>(.*?)<\/strong><\/p>/i
          $1.strip
        else
          nil
        end
      end

      original_word     = extract_text(html_content, "Original")
      transliteration   = extract_text(html_content, "Transliteration")
      phonetic_spelling = extract_text(html_content, "Phonetic")
      part_of_speech    = html_content[/Part\(s\) of speech:\s*(.*?)<\/p>/i, 1]&.strip
      origin            = html_content[/Origin:\s*(.*?)<\/p>/i, 1]&.strip

      # Definitions
      thayer_def_matches = html_content.scan(/<ol><li>(.*?)<\/li>/i).flatten
      thayer_def = thayer_def_matches.join("; ")
      strong_def = html_content[/<strong>Strong's Definition<\/strong>:(.*?)<\/p>/im, 1]&.strip || ""
      definition = [thayer_def, strong_def].reject(&:empty?).join(" | ")

      # Usage examples
      usage_examples = html_content[/<b>.*?<\/b>\s*\((\d+)\).*?(<br>.*?<\/a>)+/im]&.to_s || ""

      # Save to DB
      StrongsEntry.create!(
        strongs_number: strongs_number,
        original_word: original_word,
        transliteration: transliteration,
        phonetic_spelling: phonetic_spelling,
        part_of_speech: part_of_speech,
        definition: definition,
        usage_examples: usage_examples,
        origin: origin,
        language: strongs_number.start_with?("G") ? "Greek" : "Hebrew"
      )
    end

    puts "✅ Imported #{data.size} Strong's entries"
  end
end
