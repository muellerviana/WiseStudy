# frozen_string_literal: true

class LinkComponent < ViewComponent::Base

  def initialize(text:, url:, method: :get, confirm: nil)
    @url = url
    @text = text
    @method = method
    @confirm = confirm
  end
end
