Rails.application.routes.draw do
  resources :products do
    resources :links
  end
end
