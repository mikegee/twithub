class FollowingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @users = @user.users_followed.page(params[:page])
    if @users.total_count.zero?
      start_of_notice = current_user == @user ? "You aren't" : "#{@user.name} isn't"
      flash.now[:notice] ||= "#{start_of_notice} following any users yet."
    end
  end

end
