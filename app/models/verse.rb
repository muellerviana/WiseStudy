class Verse < ApplicationRecord
  belongs_to :chapter
  has_many :words, -> { order(:position) }, dependent: :destroy
end
