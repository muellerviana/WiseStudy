class Chapter < ApplicationRecord
  belongs_to :bible_book
  has_many :verses, dependent: :destroy
end