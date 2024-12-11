Rails.application.routes.draw do
  devise_for :admins
  namespace :site do
    get 'home/index'
    resources :articles, only: [:index, :show]
    resources :books, only: [:index, :show]
    resources :authors, only: [:index, :show]
    resources :sermons, only: [:index, :show]
  end

  namespace :admins_dashboard do
    resources :home, only: [:index]
    resources :articles
    resources :authors
    resources :books
    resources :sermons
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "site/home#index"

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end
end
