class StatusesController < ApplicationController

  def index
    @statuses = current_user.timeline.page(params[:page]).per(params[:per])
  end

  def create
    @status = current_user.statuses.create!(params[:status])
    redirect_to root_url
  end

end
