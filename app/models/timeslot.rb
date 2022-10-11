class Timeslot < ApplicationRecord
    belongs_to :schedule
    delegate :service, to: :schedule
    validates_uniqueness_of :available_time
end
