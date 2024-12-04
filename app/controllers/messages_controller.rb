class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_receiver, only: [:index, :create]

  # Show conversation between current user and another user
  def index
    @messages = Message
                  .where(sender: @receiver, receiver: current_user)
                  .or(Message.where(sender: current_user, receiver: @receiver))
                  .order(:created_at)

    # Mark all unread messages in this conversation as read
    Message.where(sender: @receiver, receiver: current_user, read: false).update_all(read: true)
  end

  # Show all conversations (Inbox)
  def inbox
    # Fetch all messages sent to or received by the current user
    @messages = Message.where(receiver: current_user).includes(:sender).order(created_at: :desc)
  end

  # Send a message
  def create
    @message = current_user.sent_messages.build(message_params.merge(receiver: @receiver))

    if @message.save
      # Create a notification for the receiver
      UserNotification.create(user: @receiver, message: @message, read: false)

      # Broadcast the new message to the receiver via ActionCable
      NotificationChannel.broadcast_to(
        @receiver,
        render_to_string(partial: 'messages/message', locals: { message: @message })
      )      

      flash[:success] = "Message sent successfully!"
      redirect_to user_messages_path(@receiver)
    else
      flash[:error] = "Failed to send message."
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_receiver
    @receiver = User.find(params[:user_id])
  end
end
