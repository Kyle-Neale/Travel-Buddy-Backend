class UsersController < ApplicationController

  def index
    users = User.all
    users.map do |item|
      UserSerializer.new(item)
    end
    render json: users
  end




end
