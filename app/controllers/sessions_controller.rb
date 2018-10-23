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
    token = request.headers["Authorization"]
    begin
      payload = JWT.decode(token, "super secret key", true)
    rescue JWT::DecodeError
      nil
    end
    if payload
      id = payload[0]["user_id"]
      @user = User.find(id)
      if @user
        render json: @user
      else
        render json: {error: "User not found or token expired"}, status: 401
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
