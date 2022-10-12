module TimeslotsHelper
    def time_formatter(timeslot)
        timeslot.available_time.strftime("%I:%M%p")
    end
end
