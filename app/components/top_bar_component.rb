# frozen_string_literal: true
class TopBarComponent < ViewComponent::Base
  renders_one :logotype, LogotypeComponent
  renders_one :search_bar, SearchBarComponent
  renders_one :social_networks, SocialNetworksComponent
  renders_one :user_actions, UserActionsComponent
end