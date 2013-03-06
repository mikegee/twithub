class FollowingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @users = @user.users_followed.page(params[:page])
    unless @users.any?
      start_of_notice = current_user == @user ? "You aren't" : "#{@user.name} isn't"
      flash.now[:notice] ||= "#{start_of_notice} following any users yet."
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

  def destroy
    Follow.where(follower_id: current_user.id, followee_id: params[:id]).delete_all
    redirect_to :back
  end

end
