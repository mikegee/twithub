class DirectMessagesController < ApplicationController
  def index
    @direct_messages = current_user.incoming_direct_messages.page(params[:page])
  end
end
