namespace :import do
  desc "Import Textus Receptus NT - Books, Chapters, Verses, and Words"
  task textus_receptus: :environment do
    file_path = Rails.root.join("db/data/textus_receptus_nt.json")
    data = JSON.parse(File.read(file_path))

    testament = "New Testament"

    books_cache = {}
    chapters_cache = {}

    puts "📖 Starting import of Textus Receptus NT..."

    data['verses'].each do |v|
      book_number  = v['book']
      book_name    = v['book_name']
      chapter_num  = v['chapter']
      verse_num    = v['verse']
      text         = v['text']

      puts "Creating: #{book_name}, #{chapter_num}, #{verse_num}"

      # Create or cache the Bible book
      book = books_cache[book_number] ||= BibleBook.find_or_create_by!(
        name: book_name,
        testament: testament
      )

      # Cache key for chapters: "book_id:chapter_num"
      chapter_key = "#{book.id}:#{chapter_num}"
      chapter = chapters_cache[chapter_key] ||= Chapter.find_or_create_by!(
        bible_book: book,
        number: chapter_num
      )

      # Create or find the verse
      verse = Verse.find_or_create_by!(
        chapter: chapter,
        number: verse_num
      )

      # Remove previous words if re-importing
      verse.words.destroy_all if verse.words.any?

      # Split text into words
      words = text.split(/\s+/)
      words.each_with_index do |word, index|
        Word.create!(
          verse: verse,
          position: index + 1,
          original: word
        )
      end
    end

    puts "✅ Successfully imported #{data['verses'].size} verses from Textus Receptus NT"
  end
end
