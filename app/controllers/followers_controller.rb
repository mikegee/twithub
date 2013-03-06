class FollowersController < ApplicationController

  def index
    @users = current_user.followers.page(params[:page])
    unless @users.any?
      flash.now[:notice] ||= "Nobody is following you yet."
    end
  end

end
