class Service < ApplicationRecord
    belongs_to :category
    has_many :addons, dependent: :destroy
    has_many :schedules, dependent: :destroy
    has_many :timeslots, through: :schedules

    validates_uniqueness_of :name    
    
    # scope :available_services, -> { where(id: service_id_with_timeslots) }    

    # def service_id_with_timeslots
    #     @service_id_with_timeslots = Schedule.all.map do |schedule|
    #         return unless schedule.timeslots.any?
    #         schedule.service_id
    #     end
    #     @service_id_with_timeslots.compact.uniq
    # end

end
