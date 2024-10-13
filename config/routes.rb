# frozen_string_literal: true

Rails.application.routes.draw do
  get 'cart' => 'cart_items#index'
  post 'cart/:id/' => 'cart_items#create'
  delete 'cart/:id/' => 'cart_items#destroy'
  post '/order' => 'orders#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'items#index'
  resources :coupons, only: %i[create]
  resources :items, only: %i[index create show]
  namespace :admin do
    resources :items, only: %i[index new create edit update destroy]
    get 'orders' => 'order_items#index'
    get 'orders/:id' => 'order_items#show'
  end
end
