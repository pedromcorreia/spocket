Rails.application.routes.draw do
  devise_for :suppliers
  devise_for :retailers
  get 'home/index'
  devise_for :views
  root to: "home#index"
end
