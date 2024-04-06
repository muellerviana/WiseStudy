# frozen_string_literal: true

class TopBarComponent < ViewComponent::Base
  erb_template <<-ERB
    <span logo="<%= @logo %>"><%= content %></span>
  ERB

  def initialize(logo:)
    @logo = logo
  end
end
