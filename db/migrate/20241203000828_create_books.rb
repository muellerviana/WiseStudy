class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.integer :publication_year
      t.string :isbn
      t.text :summary
      t.string :genre
      t.string :language
      t.string :book_cover

      t.timestamps
    end
  end
end
