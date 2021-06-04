Rails.application.routes.draw do
  resources :product_attachments
  devise_for :suppliers
  devise_for :retailers
  resources :products do
    resources :variants
  end

  get 'home/index'
  devise_for :views
  root to: "home#index"
end
