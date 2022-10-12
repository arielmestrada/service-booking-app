class Schedule < ApplicationRecord
    belongs_to :service
    has_many :timeslots, dependent: :destroy
    validates :available_date, presence: true, uniqueness: { scope: :service }, comparison: { greater_than_or_equal_to: Date.today }
end
