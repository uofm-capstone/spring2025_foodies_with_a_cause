class MessageDigestJob < ApplicationJob
  queue_as :default

  def perform
    current_time = Time.zone.now.strftime("%-l:%M %P") # e.g., "1:31 am"

    puts "Checking users at #{current_time}"

    User.find_each do |user|
      user_time = user.summary_email_time&.strip&.downcase
      puts " #{user.email} wants email at #{user_time}"

      next unless user_time == current_time

      unread_messages = user.received_messages.where(read: false)

      if unread_messages.any?
        MessageMailer.with(messages: unread_messages, receiver: user).new_message_notification.deliver_now
        puts "Digest sent to #{user.email} (#{unread_messages.count} unread messages)"
      else
        puts "No unread messages for #{user.email}"
      end
    end
  end
end
