class UserNotificationsController < ApplicationController
  before_action :set_user

  def index
    @notifications = @user.user_notifications
  end

  def show
    @notification = @user.user_notifications.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
