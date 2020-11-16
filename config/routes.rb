Rails.application.routes.draw do
  devise_for :users
  root to: 'castles#index'
  resources :castles, only: [:show, :create, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
