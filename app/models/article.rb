class Article < ApplicationRecord
  validates :title, :author, :content, presence: true

  mount_uploader :image, ImageUploader
end
