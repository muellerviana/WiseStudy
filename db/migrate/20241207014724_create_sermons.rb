class CreateSermons < ActiveRecord::Migration[7.1]
  def change
    create_table :sermons do |t|
      t.string :title
      t.string :format
      t.text :description
      t.string :video_url
      t.string :audio_url
      t.integer :duration
      t.date :date
      t.string :category
      t.string :bible_text
      t.string :language

      t.timestamps
    end
  end
end
