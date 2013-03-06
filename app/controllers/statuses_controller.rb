class StatusesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @statuses = @user.statuses.page(params[:page]).per(params[:per])
  end

  def create
    @status = current_user.statuses.create!(params[:status])
    redirect_to root_url
  end

end
