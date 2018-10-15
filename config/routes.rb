Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :friendships, only: [:create, :update]
  resources :places, only: [:index, :create]
  resources :comments, only: [:create, :destroy]
  resources :spots, only: [:index, :create, :update, :destroy]
  resources :notifications, only: [:index, :update]
end
