class ApplicationController < ActionController::Base
  devise_group :user, contains: [:supplier, :retailer]
end
