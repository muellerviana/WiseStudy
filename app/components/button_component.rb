# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(text:, link:, method: :get, confirm_message: nil)
    @text = text
    @link = link
    @turbo_method = method
    @confirm_message = confirm_message
  end
end
