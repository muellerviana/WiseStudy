class Author < ApplicationRecord
  validates :name, :last_name, :birth_date, presence: true
end
