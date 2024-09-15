# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
  resources :items, only: [:index, :create, :show]
  namespace :admin do
    resources :items, only:[:index, :show, :edit, :new, :create, :destroy]
  end
end
