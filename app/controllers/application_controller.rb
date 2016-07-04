class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!

  include Pundit

  skip_after_action :verify_authorized, only: [:index, :new, :show, :create]

  def is_admin?
    current_user.admin?
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
