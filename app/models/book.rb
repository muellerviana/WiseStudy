class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  accepts_nested_attributes_for :authors

  validates_presence_of :title
  
  mount_uploader :book_cover, BookCoverUploader

  def display_attributes
    {
      title: title,
      summary: summary
    }
  end
end
