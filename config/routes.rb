Rails.application.routes.draw do
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/show'
  devise_for :users
  root to: 'castles#index'
  resources :castles, only: [:show, :create, :new] do
    resources :bookings, only: [:show, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
