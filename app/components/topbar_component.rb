# frozen_string_literal: true

class TopbarComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
