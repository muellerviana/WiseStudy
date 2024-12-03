class CreateBooksAuthorsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :authors_books, id: false do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :author, null: false, foreign_key: true
    end
  end
end
