class Verse < ApplicationRecord
  belongs_to :chapter
  has_many :words, dependent: :destroy
end
