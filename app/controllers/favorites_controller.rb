class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @statuses = @user.favorites.page(params[:page])
  end

  def create
    if params[:user_id].to_i == current_user.id
      current_user.favorites << Status.find(params[:status_id])
      redirect_to :back
    else
      redirect_to :back, notice: "You can't mark favorites for other users, silly!"
    end
  end

end
