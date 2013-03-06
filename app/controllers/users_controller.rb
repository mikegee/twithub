class UsersController < ApplicationController

  respond_to :json

  def search
    @users = User.where('name LIKE ?', "%#{params[:term]}%").limit(10)
    response_data = @users.map{|s| {id: s.id, label: s.name}}
    respond_with(response_data)
  end

end
