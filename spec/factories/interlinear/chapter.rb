# spec/factories/chapters.rb
FactoryBot.define do
  factory :chapter do
    association :bible_book
    number { 1 }

    trait :with_verses do
      after(:create) do |chapter, evaluator|
        create_list(:verse, (evaluator.verses_count || 3), chapter: chapter)
      end
    end
  end
end