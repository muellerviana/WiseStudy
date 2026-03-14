class CreateBibleBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :bible_books do |t|
      t.string :name
      t.string :testament

      t.timestamps
    end
    add_index :bible_books, :testament
  end
end
