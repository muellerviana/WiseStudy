# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(text:, link:)
    @text = text
    @link = link
  end
end
