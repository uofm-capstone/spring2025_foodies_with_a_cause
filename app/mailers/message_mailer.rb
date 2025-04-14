
class MessageMailer < ApplicationMailer
  def new_message_notification
    @messages = params[:messages]
    @receiver = params[:receiver]

    mail(
      to: @receiver.email,
      subject: "You have #{@messages.count} unread message#{'s' if @messages.count > 1} on Produce Bridge"
    )
  end
end
