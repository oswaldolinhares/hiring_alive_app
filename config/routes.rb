Rails.application.routes.draw do
  resources :product_uploads, only: [:new, :create]
  resources :products, only: [:index]
  resources :models, only: [:index], defaults: { format: :json }
  root to: 'product_uploads#new'
end