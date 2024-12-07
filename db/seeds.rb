# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#create task to clean an rebuild database
#rails db:drop

author1 = Author.create(name: "C.S",
                        last_name: "Lewis",
                        birth_date:('1898-09-29'),
                        death_date:('1969-07-21'),
                        nationality: "Ireland",
                        website: nil
                        )
author2 = Author.create(name: "Muller",
                        last_name: "Viana",
                        birth_date:('1898-09-29'),
                        nationality: "Brasil",
                        website: nil
                        )

book = Book.create( 
    title: "Mere Cristianity",
    publisher: "HarperCollins Publishers",
    publication_year: "2009" , 
    isbn: "9780007332243", 
    summary: "One of the most popular and beloved introductions to the concept of faith ever written, Mere Christianity has sold millions of copies worldwide.",  
    genre: "Teologia",
    language: "English",
  )

book.authors << author1

book.save!

#create article
article = Article.create(
  title: "Historia da Teologia Reformada",
  description: "Breve resumo",
  body: "lorem ipsum dolor si amet"
)

article.authors << author1


#create sermon
sermon = Sermon.create(
 title: "A Vinda de Cristo para Julgar Sodoma e Gomorra",
 format: "Video",
 description: "Série: As Vindas de Cristo em Juízo no Velho Testamento - Parte 1",
 video_url: "https://www.youtube.com/embed/_5MT_gI485U?si=Dxgw1hDJKJ4ascZ7",
 audio_url: nil,
 duration: nil,
 date: nil,
 category: nil,
 bible_text: "Gênesis 18:1-33)",
 language: "Português"
)
 

