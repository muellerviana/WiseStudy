# frozen_string_literal: true

class HeroSectionComponent < ViewComponent::Base
 def initialize(folder_link:, title:, text:, css_classes:)
    @folder_link = folder_link
    @title = title
    @text = text
    @css_classes = css_classes
  end
end
