class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.references :verse, null: false, foreign_key: true
      t.integer :position
      t.string :original
      t.string :transliteration
      t.string :strong_number
      t.string :translation

      t.timestamps
    end
  end
end
