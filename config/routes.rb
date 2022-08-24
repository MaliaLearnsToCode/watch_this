Rails.application.routes.draw do
  devise_for :users

  root to: 'watches#index'

  resources :watches do
    resources :bookings, only: %i[new create]
  end
  # resources :bookings, only: %i[edit update]

  # resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
