class Article < ApplicationRecord
  validates :title, :description, :body, presence: true 
  has_and_belongs_to_many :authors

  accepts_nested_attributes_for :authors

  mount_uploader :article_cover, ArticleCoverUploader
end
