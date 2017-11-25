Rails.application.routes.draw do
  root 'home#main'

  resources :products do
    resources :links
  end
  resources :shops, only: :index
end
