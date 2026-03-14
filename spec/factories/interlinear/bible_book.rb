# spec/factories/bible_books.rb
FactoryBot.define do
  factory :bible_book do
    name { "Matthew" }
    testament { "New Testament" }

    trait :complete do
      after(:create) do |book|
        create_list(:chapter, 2, bible_book: book) do |chapter|
          create_list(:verse, 3, chapter: chapter) do |verse|
            create(:verse, :with_words, id: verse.id)
          end
        end
      end
    end
  end
end