class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_receiver, only: [:index, :create]
  protect_from_forgery with: :exception

  # Show messages between current user and receiver
  def index
    @current_user_id = current_user.id
    @messages = Message
                  .where(sender: current_user, receiver: @receiver)
                  .or(Message.where(sender: @receiver, receiver: current_user))
                  .order(:created_at)
  
    unread_messages = @messages.where(sender: @receiver, read: false)
    unread_messages.update_all(read: true)
  
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # Show inbox with all conversations for the current user
  def inbox
    Rails.logger.debug { "MessagesController#inbox called" }
    @messages = current_user.received_messages
                            .includes(:sender)
                            .order(created_at: :desc)
  end

  # Send a new message# app/controllers/messages_controller.rb
  def create
    @message = current_user.sent_messages.build(message_params.merge(receiver: @receiver))
  
    if @message.save
      # Broadcast to the sender's view
      Turbo::StreamsChannel.broadcast_append_to(
        "chat_channel_#{current_user.id}",
        target: "new_messages",
        partial: "messages/message",
        locals: { message: @message, current_user_id: current_user.id }
      )
  
      # Broadcast to the receiver's view
      Turbo::StreamsChannel.broadcast_append_to(
        "chat_channel_#{@receiver.id}",
        target: "new_messages",
        partial: "messages/message",
        locals: { message: @message, current_user_id: @receiver.id }
      )
  
      respond_to do |format|
        format.html { head :ok } # Avoid full-page redirect
      end
    else
      render :index, alert: 'Failed to send message.'
    end
  end
  
  
  

  private


  # Strong parameters for message creation
  def message_params
    params.require(:message).permit(:content)
  end

  # Set the receiver for the message
  def set_receiver
    @receiver = User.find_by(id: params[:user_id])

    unless @receiver
      Rails.logger.error { "Receiver not found for user_id: #{params[:user_id]}" }
      redirect_to root_path, alert: "Receiver not found."
    end
  end
end
