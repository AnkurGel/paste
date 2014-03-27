class SessionsController < ApplicationController

  def create
    user = User.from_github(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_back_or root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_back_or root_url, alert: "Signed out successfully!"
  end

  def new
    redirect_to '/auth/github'
  end

end
