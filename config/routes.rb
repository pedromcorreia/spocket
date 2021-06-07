Rails.application.routes.draw do
  resources :integration_stores, only: [:index, :new, :create]
  resources :orders
  resources :stores, except: [:index]
  resources :product_attachments
  devise_for :suppliers
  devise_for :retailers
  resources :products do
    resources :variants
  end
  get '/search' => 'products#search', :as => 'search_product'
  post '/sync_integration_stores' => 'integration_stores#sync', :as => 'sync_integration_stores'

  get 'home/index'
  devise_for :views
  root to: 'home#index'
end
