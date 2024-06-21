class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :body
      t.string :image_url

      t.timestamps
    end
  end
end
