class Service < ApplicationRecord
    belongs_to :category
    has_many :addons, dependent: :destroy
    has_many :schedules, dependent: :destroy
    has_many :timeslots, through: :schedule

    validates_uniqueness_of :name
end
