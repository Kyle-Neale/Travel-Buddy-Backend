class ApplicationController < ActionController::API
  private
  def issue_token(payload)
    JWT.encode(payload, "super secret key", true)
  end

  def user
    User.find_by(id: token_user_id)
  end

  def token_user_id
    decoded_token.first['user_id']
  end

  def decoded_token
    if token
      begin
        JWT.decode(token, "super secret key", true)
      rescue JWT::DecodeError
        return [{}]
      end
    else
      [{}]
    end
  end

  def token
    request.headers['Authorization']
  end
end
