class BibleBook < ApplicationRecord
  has_many :chapters, dependent: :destroy
end