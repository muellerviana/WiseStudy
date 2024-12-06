class CreateArticlesAuthorsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :articles_authors, id: false do |t|
      t.references :article, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
    end
  end
end
