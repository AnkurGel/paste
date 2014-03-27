class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def store_current_location
    session[:last_url] = request.url  if request.get?
  end

  def redirect_back_or(default, *args)
    redirect_to((session[:last_url] || default), *args)
    session.delete(:last_url)
  end

  helper_method :current_user, :signed_in?
end
