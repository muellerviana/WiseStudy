class CreateStrongsEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :strongs_entries do |t|
      t.string :strongs_number
      t.string :original_word
      t.string :transliteration
      t.string :phonetic_spelling
      t.string :part_of_speech
      t.text :definition
      t.text :usage_examples
      t.text :origin
      t.string :language
      t.string :lexicon_source

      t.timestamps
    end
    add_index :strongs_entries, :strongs_number
  end
end
