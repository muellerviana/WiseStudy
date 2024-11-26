class CardComponent < ViewComponent::Base
  def initialize(title:, body:, link:, image:)
    @title = title
    @body = body
    @link = link
    @image = image
  end
end