namespace :export do
  desc "Export the entire Bible (books, chapters, verses, words) into a JSON file"
  task bible: :environment do
    puts "📖 Starting export..."

    bible_books = BibleBook.includes(chapters: { verses: :words })

    json = bible_books.as_json(
      include: {
        chapters: {
          include: {
            verses: {
              include: {
                words: {
                  # include ALL word attributes
                  only: [
                    :id,
                    :position,
                    :original,
                    :transliteration,
                    :strong_number,
                    :translation
                  ]
                }
              },
              # include all verse attributes
              only: [:id, :number]
            }
          },
          # include all chapter attributes
          only: [:id, :number]
        }
      },
      # include all BibleBook attributes
      only: [:id, :name, :testament]
    )

    File.open("bible_export.json", "w") do |file|
      file.write(JSON.pretty_generate(json))
    end

    puts "✅ Bible export completed!"
    puts "📂 File saved as bible_export.json"
  end
end
