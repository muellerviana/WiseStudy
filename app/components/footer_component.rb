# frozen_string_literal: true

class FooterComponent < ViewComponent::Base
  def initialize()
  end

  renders_one :social_network, SocialNetworksComponent
end
