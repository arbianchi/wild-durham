class ApplicationController < ActionController::Base
  include Pundit

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!, except: [:index]

  after_action :verify_authorized, unless: :devise_controller? 
  rescue_from Pundit::NotAuthorizedError do |e|
    flash[:danger] = "NO!"
    redirect_to "/"
  end

  skip_after_action :verify_authorized, only: [:index, :new, :show, :create]

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :phone) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :phone) }
  end


  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
