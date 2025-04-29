
class MessageMailer < ApplicationMailer
  def new_message_notification
    @receiver = params[:receiver]
    @messages = Array(params[:messages] || params[:message])

    mail(
      to: @receiver.email,
      subject: @messages.length == 1 ? "New message from #{@messages.first.sender.full_name}" : "Daily summary of unread messages"
    )
  end
end
