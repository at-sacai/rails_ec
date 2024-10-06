# frozen_string_literal: true

Rails.application.routes.draw do
  get 'cart' => 'cart_items#index'
  post 'cart/:id/' => 'cart_items#create'
  delete 'cart/:id/' => 'cart_items#destroy'
  resources :orders, only: %i[create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'items#index'
  resources :items, only: %i[index create show]
  namespace :admin do
    resources :items, only: %i[index new create edit update destroy]
    resources :orders, only: %i[index]
  end
end
