# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#main'

  resources :products do
    resources :links
  end
  resources :shops, only: :index
end
