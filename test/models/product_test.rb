# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  amount     :string
#  expiration :date
#  hold       :string
#  marketer   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
