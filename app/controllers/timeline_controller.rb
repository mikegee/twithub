class TimelineController < ApplicationController

  def index
    @statuses = current_user.timeline.page(params[:page]).per(params[:per]) if current_user
  end

end
