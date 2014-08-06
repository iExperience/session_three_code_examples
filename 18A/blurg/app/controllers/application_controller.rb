class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate, only: [:edit, :update, :destroy]

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def signed_in?
    not current_user.nil?
  end
  helper_method :signed_in?

  def authenticate
    redirect_to sign_in_path unless signed_in?
  end
end
