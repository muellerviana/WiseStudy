# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(text:, href: nil)
    @text = text    
    @href = href
  end
end
