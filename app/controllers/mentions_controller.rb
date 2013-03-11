class MentionsController < ApplicationController

  def index
    @statuses = current_user.mentioning_statuses.page(params[:page])
  end

end
