# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#main'

  resources :products do
    resources :links
    resources :prices, only: :index
  end

  resources :shops, only: :index
end
