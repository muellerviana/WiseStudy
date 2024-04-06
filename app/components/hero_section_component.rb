# frozen_string_literal: true

class HeroSectionComponent < ViewComponent::Base
 def initialize(folder_link:, title:, text:)
    @folder_link = folder_link
    @title = title
    @text = text
  end
end
