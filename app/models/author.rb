class Author < ApplicationRecord
  has_and_belongs_to_many :books
  validates :name, :last_name, :birth_date, presence: true
end
