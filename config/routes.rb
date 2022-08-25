Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "watches#index"
  # resources :bookings
  # resources :watches
  # resources :users

  resources :users do
    resources :watches, only: %i[new create show destroy edit update]
  end

  resources :watches do
    resources :bookings, only: %i[new create]
  end
  # resources :bookings, only: %i[edit update]

  # resources :users
end
