Rails.application.routes.draw do
  devise_for :users
  root to: 'castles#homepage'
  resources :castles, only: [:index, :show, :create, :new] do
    resources :bookings, only: [:show, :create]

    # collection do
    #   get :bookings, to: "bookings#index"
    # end
  end

  resources :bookings, only: [:index] do
    member do
      post "confirm", to: "bookings#confirm"
      post "decline", to: "bookings#decline"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
