# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  contact_preference     :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  full_name              :string           default(""), not null
#  location               :string           default(""), not null
#  organization_type      :string           default(""), not null
#  phone_number           :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  user_type              :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
  :recoverable, :rememberable, :validatable
has_many :products, dependent: :destroy
ORGANIZATION_TYPES = [
'Food retailer',
'Restaurant',
'Truck driver',
'Food pantry / soup kitchen',
'Food processors',
'Farm',
'Individual (not associated with an organization)'
]

CONTACT_PREFERENCES = ['text', 'email']

#validates :organization_type, inclusion: { in: ORGANIZATION_TYPES, message: "%{value} is not a valid organization type" }
#validates :contact_preference, inclusion: { in: CONTACT_PREFERENCES, message: "%{value} is not a valid contact preference" }
end
