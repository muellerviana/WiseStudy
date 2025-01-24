# frozen_string_literal: true
class TopBarComponent < ViewComponent::Base
  renders_one :logotype, LogotypeComponent
  renders_one :language, LanguageComponent
  renders_one :search_bar, SearchBarComponent
  renders_one :social_networks, SocialNetworksComponent
  renders_one :user_actions, UserActionsComponent
  renders_one :toggle_menu_button, ToggleMenuButtonComponent
end