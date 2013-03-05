class SessionsController < ApplicationController

  def create
    redirect_to request.env['omniauth.origin'] || root_url
  end

end
