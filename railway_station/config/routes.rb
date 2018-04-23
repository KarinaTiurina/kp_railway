Rails.application.routes.draw do
  devise_for :users

  root "users#index"

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :train, only: [:index, :show, :edit, :update, :destroy]
end
