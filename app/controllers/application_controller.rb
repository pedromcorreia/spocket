class ApplicationController < ActionController::Base
  devise_group :user, contains: [:supplier, :retailer]

  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    redirect_to root_url
  end
end
