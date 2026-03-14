# spec/factories/words.rb
FactoryBot.define do
  factory :word do
    association :verse
    original { "Deus" }
    transliteration { nil }
    strong_number { nil }
    translation { nil }
    position { 1 }
  end
end