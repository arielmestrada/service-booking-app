class Schedule < ApplicationRecord
    belongs_to :service
    has_many :timeslots, dependent: :destroy
    validates_uniqueness_of :available_date
end
