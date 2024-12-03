class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :last_name
      t.text :bio
      t.date :birth_date
      t.date :death_date
      t.string :nationality
      t.string :book_avatar
      t.string :website

      t.timestamps
    end
  end
end
