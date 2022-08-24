Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "pages#home"
  resources :bookings
  resources :watches
  resources :users
  root to: 'watches#index'

  resources :watches do
    resources :bookings, only: %i[new create]
  end
  # resources :bookings, only: %i[edit update]

  # resources :users
end
