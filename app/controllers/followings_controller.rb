class FollowingsController < ApplicationController

  def index
    @users = current_user.users_followed.page(params[:page])
    unless @users.any?
      flash.now[:notice] = "You aren't following any users yet."
    end
  end

  def create
    uid = params[:follow][:followee_id]

    if current_user.id == uid.to_i
      flash[:notice] = "You can't follow yourself, silly!"
    elsif uid.present?
      # silently ignore failure to create here
      Follow.create(follower_id: current_user.id, followee_id: uid)
    end

    redirect_to :back
  end

end
