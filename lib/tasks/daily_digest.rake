

namespace :messages do
  desc "Send daily unread message digest to each user"
  task send_digest: :environment do
    puts "🕒 Starting digest check..."

    demo_user = User.find_by(email: "user1@email.com") # 🔁 Replace with demo account email

    if demo_user
      unread_messages = demo_user.received_messages.where(read: false)

      unless unread_messages.empty?
        MessageMailer.with(messages: unread_messages, receiver: demo_user).new_message_notification.deliver_now
        puts "📬 Sent daily digest to #{demo_user.email} with #{unread_messages.count} messages"
      else
        puts "✅ No unread messages for #{demo_user.email}"
      end
    else
      puts "⚠️ Demo user not found"
    end
  end
end
