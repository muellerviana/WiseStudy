class Book < ApplicationRecord
  has_and_belongs_to_many :authors

  validates_presence_of :title
end
