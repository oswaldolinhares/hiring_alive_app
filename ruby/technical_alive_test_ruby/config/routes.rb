Rails.application.routes.draw do
  resources :product_uploads, only: [:new, :create]
  resources :products, only: [:index]
  root to: 'product_uploads#new'
end
