class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :body
      t.string :article_cover

      t.timestamps
    end
  end
end
