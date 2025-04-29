# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  contact_preference     :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  full_name              :string           default(""), not null
#  instant_email          :boolean          default(FALSE)
#  latitude               :float
#  location               :string           default(""), not null
#  longitude              :float
#  organization_type      :string           default(""), not null
#  payment_amount         :integer
#  phone_number           :string           default(""), not null
#  plan                   :string
#  profile_message        :text
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  summary_email          :boolean          default(FALSE)
#  summary_email_time     :string
#  subscription_ends_at   :datetime
#  subscription_status    :string
#  user_type              :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stripe_customer_id     :string
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
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id", dependent: :destroy
  has_many :user_notifications, dependent: :destroy

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

  validates :organization_type, inclusion: { in: ORGANIZATION_TYPES, message: "%{value} is not a valid organization type" }, allow_blank: true
  validates :contact_preference, inclusion: { in: CONTACT_PREFERENCES, message: "%{value} is not a valid contact preference" }, allow_blank: true

  # Validations for coordinates
  validates :latitude, numericality: true, allow_nil: true
  validates :longitude, numericality: true, allow_nil: true

  geocoded_by :location  # location is a text address
  after_validation :geocode_with_log, if: :will_save_change_to_location?

def geocode_with_log
  Rails.logger.debug "Running geocode for #{self.location}"
  geocode
  Rails.logger.debug "Result: #{self.latitude}, #{self.longitude}"
end

  after_create do
    # Format phone number to E.164 format for Stripe
    formatted_phone = nil
    if phone_number.present?
      digits_only = phone_number.gsub(/\D/, '')
      formatted_phone = "+1#{digits_only}"
    end

    Stripe::Customer.create(
      email: email,
      name: full_name,
      phone: formatted_phone
    )
  end

end
