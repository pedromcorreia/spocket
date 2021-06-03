Rails.application.routes.draw do
 devise_for :suppliers
  devise_for :retailers
  resources :products do
    resources :variants
  end

  get 'home/index'
  devise_for :views
  root to: "home#index"
end
