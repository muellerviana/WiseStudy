# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


author1 = Author.create(name: "Tolkien", last_name: "J.R", birth_date:('1982-01-01'))
author2 = Author.create(name: "Lewis", last_name: "C.S", birth_date:('1999-01-12'))

book = Book.create(title: "Book Title")

book.authors << author1
book.authors << author2

book.save!