class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @statuses = @user.favorites.page(params[:page])
  end

  def create
    current_user.favorites << Status.find(params[:status_id])
    redirect_to :back
  end

  def destroy
    current_user.favorite_marks.where(status_id: params[:id]).delete_all
    redirect_to :back
  end

end
