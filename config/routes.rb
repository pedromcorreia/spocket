Rails.application.routes.draw do
  resources :integration_stores
  resources :integrations
  resources :orders
  resources :stores, except: [:index]
  resources :product_attachments
  devise_for :suppliers
  devise_for :retailers
  resources :products do
    resources :variants
  end
  get '/search' => 'products#search', :as => 'search_product'
  post '/import_product' => 'products#import', :as => 'import_product'

  get 'home/index'
  devise_for :views
  root to: 'home#index'
end
