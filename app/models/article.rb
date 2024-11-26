class Article < ApplicationRecord
  validates :title, :description, :body, presence: true

  mount_uploader :article_cover, ArticleCoverUploader
end
