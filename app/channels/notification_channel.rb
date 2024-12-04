class NotificationChannel < ApplicationCable::Channel
  def subscribed
    if current_user
      stream_from "notifications_#{current_user.id}"
    else
      reject
    end
  end

  def unsubscribed
    # Cleanup when channel is unsubscribed
  end
end
