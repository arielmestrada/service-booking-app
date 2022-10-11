class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates_uniqueness_of :contact_number
  validates_presence_of :first_name, :last_name, :contact_number, :street, :village, :city, :province, :postal_code
  
  has_many :booking_numbers, dependent: :destroy
  has_many :payment_options, dependent: :destroy
end
