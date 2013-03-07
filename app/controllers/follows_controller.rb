class FollowsController < ApplicationController

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

  def destroy
    Follow.where(follower_id: current_user.id, followee_id: params[:id]).delete_all
    redirect_to :back
  end

end
