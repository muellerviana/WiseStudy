Rails.application.routes.draw do
  devise_for :admins
  namespace :site do
    get 'interlinear', to: 'interlinear#index'
    get 'home/index'
    get 'search', to: 'search#index'
    resources :articles, only: [:index, :show]
    resources :books, only: [:index, :show]
    resources :authors, only: [:index, :show]
    resources :sermons, only: [:index, :show]
    resources :bible_books, only: [:index, :show] do
      resources :chapters, only: [:show] do
        resources :verses, only: [:index, :show]
      end
    end
  end

  namespace :admins_dashboard do
    resources :home, only: [:index]
    resources :articles
    resources :authors
    resources :books
    resources :sermons
    resources :strongs_entries
    resources :bible_books, only: [:index, :show] do
      resources :chapters, only: [:show] do
        resources :verses, only: [:index, :show]
      end
    end
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
