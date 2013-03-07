class FollowersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @users = @user.followers.page(params[:page])
    if @users.total_count.zero?
      name = @user == current_user ? 'you' : @user.name
      flash.now[:notice] ||= "Nobody is following #{name} yet."
    end
  end

end
