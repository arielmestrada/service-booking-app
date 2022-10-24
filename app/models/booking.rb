class Booking < ApplicationRecord
    after_create :decrease_timeslot_slot

    private

    def decrease_timeslot_slot
        @scheduled_date = self.scheduled_date
        @scheduled_time = self.scheduled_time
        @timeslot = Schedule.find_by(available_date: @scheduled_date).timeslots.find_by(available_time: @scheduled_time)
        @updated_slot = @timeslot.slots - 1
        @timeslot.update(slots: @updated_slot)
    end
end
