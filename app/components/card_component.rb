class CardComponent < ViewComponent::Base
  def initialize(title:, body:)
    @title = title
    @body = body
  end
end