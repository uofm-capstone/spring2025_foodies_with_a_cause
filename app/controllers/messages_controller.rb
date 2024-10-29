class MessagesController < ApplicationController
  before_action :set_users, only: [:index, :create]
  before_action :set_receiver, only: [:index, :create]

  # Show conversation between current user and another user
  def index
    @messages = Message.where(sender: current_user, receiver: @receiver)
                       .or(Message.where(sender: @receiver, receiver: current_user))
                       .order(created_at: :asc)
  end

  # Send a message
  def create
    @message = current_user.sent_messages.build(content: message_params[:content], receiver: @receiver)
    if @message.save
      redirect_to user_messages_path(@receiver)
    else
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

  def set_users
    @users = User.where.not(id: current_user.id)
  end
end

