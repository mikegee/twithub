class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    return @current_user if defined?(@current_user)

    if session.key?(:user_id)
      @current_user = User.find(session[:user_id])
    end
  end

end
