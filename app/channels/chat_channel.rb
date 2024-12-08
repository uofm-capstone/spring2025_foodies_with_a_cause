class ChatChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "chat_channel_#{[params[:current_user_id], params[:receiver_id]].sort.join('_')}"
    stream_from channel_name
  end
end
