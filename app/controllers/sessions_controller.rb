class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by_email(auth_hash)
    session[:user_id] = user.id
    redirect_to request.env['omniauth.origin'] || root_url
  end

  def destroy
    reset_session
    redirect_to root_url
  end


  private

  def auth_hash
    request.env['omniauth.auth'].info.slice(:name, :email)
  end

end
