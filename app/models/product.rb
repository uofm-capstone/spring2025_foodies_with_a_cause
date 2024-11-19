# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string
#  food_type   :string
#  hold        :string
#  marketer    :string
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Product < ApplicationRecord
  belongs_to :user
end
