class Author < ApplicationRecord
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :books

  accepts_nested_attributes_for :articles
  accepts_nested_attributes_for :books
  
  validates :name, :last_name, :birth_date, presence: true

  mount_uploader :author_avatar, AuthorAvatarUploader

  def display_attributes
    {
      name: name,
      last_name: last_name
    }
  end
end
