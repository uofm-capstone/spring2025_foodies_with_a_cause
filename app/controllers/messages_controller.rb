class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_receiver, only: [:index, :create]

  # Show conversation between current user and another user
  def index
    @messages = Message.between_users(current_user, @receiver).order(:created_at)
  end

  # Show all messages sent to the current user
  def inbox
    @messages = Message.where(receiver: current_user).order(created_at: :desc)
  end

  # Send a message
  def create
    @message = current_user.sent_messages.build(message_params.merge(receiver: @receiver))
    if @message.save
      redirect_to user_messages_path(@receiver)
    else
      @messages = Message.between_users(current_user, @receiver).order(:created_at)
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
