class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    return @user if defined?(@user)
    @user = session[:user_id] && User.find(session[:user_id])
  end

end
