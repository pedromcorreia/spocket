Rails.application.routes.draw do
  devise_for :suppliers
  devise_for :retailers

  devise_for :views

  root to: 'products#index'
  authenticated :supplier do
    resources :integration_stores, only: [:index, :new, :create]
    resources :product_attachments
    resources :products do
      resources :variants
    end
    post '/sync_integration_stores' => 'integration_stores#sync', :as => 'sync_integration_stores'
  end

  authenticated :retailer do
    post '/import_product' => 'products#import', :as => 'import_product'

    get '/search' => 'products#search', :as => 'search_product'
    resources :stores, except: [:index]
    resources :orders
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end

  match '*path', to: redirect('/'), via: :all
end
