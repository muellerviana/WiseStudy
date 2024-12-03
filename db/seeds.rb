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
                        birth_date:('1898-09-29'))

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