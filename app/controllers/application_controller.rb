class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate

  private

  def authenticate
    session[:redirect_to] = request.path
    redirect_to '/login' unless session[:user_id]
  end
end
