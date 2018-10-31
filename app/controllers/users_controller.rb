class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @all = User.all
    @unfriended = User.unfriended(user)
    @friends = user.accepted_friends
    @requested_friends = user.requested_friends
    @pending_friends = user.pending_friends
    render json:
      {
        all: @all,
        unfriended: @unfriended,
        pending_friends: @pending_friends,
        accepted_friends: @friends,
        requested_friends: @requested_friends
      }
  end

  def show
    render json: user
  end

  def create
    byebug
     user = User.new(user_params)
     if user.save
       token = JWT.encode( {user_id: user.id}, "super secret key")
       render json: {
         user: { user: UserSerializer.new(user), token: token }
       }
    else
      render json: {error: user.errors.messages}
    end
  end

  def update
    if user.update(user_params)
      render json: user
    else
      render json: [error: user.errors.messages]
    end
  end

  def destroy
    user.destroy
    render json: ['message': "User deleted"]
  end

  private

  def set_user
    user = User.find_by(id: params[:id])
    user
  end

  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name)
  end

end
