class FollowingsController < ApplicationController

  def index
    @users = current_user.users_followed.page(params[:page])
    unless @users.any?
      flash.now[:notice] = "You aren't following any users yet."
    end
  end

  def create
    current_user.users_followed << User.find(params[:follow][:followee_id])
    redirect_to :back
  end

end
