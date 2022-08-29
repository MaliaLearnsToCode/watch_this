Rails.application.routes.draw do
  devise_for :users

  root to: 'watches#index'

  resources :users do
    resources :watches, only: %i[edit update]
  end


  resources :watches, only: %i[destroy index create new show] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create] do
    member do
      get :success
    end
    # resources :review, only: %i[new create]
  end

  # resources :user do
  #   resources :review, only: %i[show]
  # end
end
