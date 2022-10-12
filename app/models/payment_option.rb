class PaymentOption < ApplicationRecord
    belongs_to :user
    validates :card_number, uniqueness: { scope: :user }
    validates_presence_of :card_number, :card_type, :expiry_date, :registered_name
end