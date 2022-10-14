class Timeslot < ApplicationRecord
    belongs_to :schedule
    has_one :service, through: :schedule
    validates :available_time, presence: true, uniqueness: { scope: :schedule }
    validates :slots, presence: true, numericality: { greater_than: 0 }, on: :create
    # validate :expired_datetime?, on: :create, on: :update

    private

    # def expired_datetime?
    #     @schedule = this.schedule.available_date
    #     @today = Date.today
    #     if @schedule <= @today && this.available_time.strftime("%H:%M") == Time.now.strftime("%H:%M")
    #         errors.add(:timeslot, "Cannot schedule past date")
    #     end
    # end
    
end
