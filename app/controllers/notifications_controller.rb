class NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(user_id: user.id, unread: true)
    render json: @notifications
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(unread: false)
    render json: @notification
  end

end
