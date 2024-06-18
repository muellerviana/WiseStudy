# frozen_string_literal: true

class LinkComponent < ViewComponent::Base

  def initialize(text:, url:, method: :get)
    @url = url
    @text = text
    @method = method
  end
end
