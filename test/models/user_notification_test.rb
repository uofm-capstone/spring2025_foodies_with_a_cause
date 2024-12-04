# == Schema Information
#
# Table name: user_notifications
#
#  id         :bigint           not null, primary key
#  read       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_notifications_on_message_id  (message_id)
#  index_user_notifications_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_id => messages.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class UserNotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
