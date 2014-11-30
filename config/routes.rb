require 'sidekiq/web'

Rails.application.routes.draw do
  # Sidekiq Web UI
  authenticate :user, lambda { |u| u.is_admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Root
  root 'welcome#index'

  # Devise
  devise_for :users , controllers: {
    registrations: 'users/registrations'
  }

  resources :posts
  resources :topics, except: [:destroy]
  resources :messages

end
