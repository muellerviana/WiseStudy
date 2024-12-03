FactoryBot.define do
  factory :author do
    name { "#{Faker::Name.name}"}
    last_name {'Doe'}
    bio {'Lorem ipsum dolor si' }
    birth_date { ('01/01/1999') }
    death_date { ('01/02/2089') }
    nationality { 'Brazil'} 
    book_avatar { nil }
    website { 'test.com.br' }
  end
end