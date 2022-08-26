Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")



   root to: 'watches#index'


  resources :users do
    resources :watches, only: %i[edit update]
  end



  resources :watches, only: %i[destroy index create new show] do
    resources :bookings, only: %i[new create show]
  end


  # resources :bookings
  # resources :bookings, only: %i[edit update]

  resources :bookings, except: %i[new create] do
    member do
      get :success
    end
  end

  # resources :bookings, only: %i[destroy]

  resources :booking do
    resources :review, only: %i[new create]
  end

  resources :user do
    resources :review, only: %i[show]
  end


  # resources :users
end
