class CardComponent < ViewComponent::Base
  def initialize(title:, body:, link:)
    @title = title
    @body = body
    @link = link
  end
end