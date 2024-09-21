class Article < ApplicationRecord
  validates :title, :description, :body, :image_url, presence: true
end
