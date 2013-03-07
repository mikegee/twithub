class TimelineController < ApplicationController

  skip_before_filter :require_user, only: [:index]

  def index
    @statuses = current_user.timeline.page(params[:page]).per(params[:per]) if current_user
  end

end
