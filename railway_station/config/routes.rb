Rails.application.routes.draw do
  devise_for :users

  root "application#index"

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :trains

  resources :ways do
    resources :tickets, only: [:create, :destroy]
  end
end
