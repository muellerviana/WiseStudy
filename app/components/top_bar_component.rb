# frozen_string_literal: true
class TopBarComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end