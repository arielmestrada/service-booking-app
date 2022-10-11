module SchedulesHelper
    def date_formatter(schedule)
        schedule.available_date.strftime("%B %d, %Y")
    end
end
