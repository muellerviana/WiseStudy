# spec/factories/verses.rb
FactoryBot.define do
  factory :verse do
    association :chapter
    number { 1 }

    transient do
      words_count { 6 }
      words_array { %w[εν αρχη ην ο λογος και ο λογος ην προς τον θεον και θεος ην ο λογος] }
    end

    trait :with_words do
      after(:create) do |verse, evaluator|
        words = evaluator.words_array.first(evaluator.words_count)
        words.each_with_index do |w, idx|
          create(:word, verse: verse, original: w, position: idx + 1)
        end
      end
    end
  end
end