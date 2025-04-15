class MessageDigestJob < ApplicationJob
  queue_as :default

  def perform
    user = User.find_by(email: "user1@email.com")
    return unless user

    unread_messages = user.received_messages.where(read: false)

    unless unread_messages.empty?
      MessageMailer.with(messages: unread_messages, receiver: user).new_message_notification.deliver_now
      puts "Digest sent to #{user.email} (#{unread_messages.count} unread messages)"
    else
      puts "No unread messages for #{user.email}"
    end
  end
end
