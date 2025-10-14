class CreateChapters < ActiveRecord::Migration[7.1]
  def change
    create_table :chapters do |t|
      t.references :bible_book, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
    add_index :chapters, :number
  end
end
