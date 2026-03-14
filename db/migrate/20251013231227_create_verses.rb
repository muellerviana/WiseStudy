class CreateVerses < ActiveRecord::Migration[7.1]
  def change
    create_table :verses do |t|
      t.references :chapter, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
    add_index :verses, :number
  end
end
