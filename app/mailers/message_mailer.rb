class MessageMailer < ApplicationMailer
  def new_message_notification
    @message = params[:message]
    @receiver = params[:receiver]

    mail(
      to: @receiver.email,
      subject: "You have a new message on Produce Bridge!"
    )
  end
end
