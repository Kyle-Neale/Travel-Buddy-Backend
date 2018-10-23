class SessionsController < ApplicationController

  def login
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      token = JWT.encode( {user_id: @user.id}, "super secret key")
      render json: {
        user: { user: UserSerializer.new(@user), token: token }
      }
    else
      render json: {error: "No user or invalid password"}, status: 401
    end
  end

  def persist
    if user
      render json: user
    else
      render json: {error: "User not found or token expired"}, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
