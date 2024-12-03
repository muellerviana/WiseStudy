FactoryBot.define do
  factory :book do
    title { 'Test Title' }
    publisher { 'Vida Nova' }
    publication_year { 1999 }
    isbn { '123456789' }
    summary { 'Lorem ipsum dolor si amet' }
    genre { 'Filosofia' }
    language { 'PT-BR' }

    after(:create) do |book|
      create_list(:author, 2, books: [book])
    end
  end
end