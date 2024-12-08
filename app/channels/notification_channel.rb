class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications_#{current_user.id}"
    Rails.logger.info "Subscribed to NotificationChannel for notifications_#{current_user.id}"
  end

  def unsubscribed
    Rails.logger.info "Unsubscribed from NotificationChannel"
  end
end
