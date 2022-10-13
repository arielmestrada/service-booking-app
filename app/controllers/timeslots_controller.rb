class TimeslotsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_schedule, :get_service, :get_category
    before_action :ensure_frame_response, only: [:new, :edit]
        
    def new
        @timeslot = @schedule.timeslots.new
    end
    
    def edit
        @timeslot = Timeslot.find(params[:id])
    end
    
    def create
        @new = @schedule.timeslots.new(timeslot_params)
        @new.time_string = @new.available_time.strftime("%I:%M%p")
        @new.save
        redirect_to category_services_path(params[:category_id])
    end
    
    def update
        @timeslot = @schedule.timeslots.update(timeslot_params)
        redirect_to category_services_path(params[:category_id])
    end
    
    def destroy
        @timeslot = Timeslot.find(params[:id]).destroy
        redirect_to category_services_path(params[:category_id])
    end
    
    private
    
    def timeslot_params
        params.require(:timeslot).permit(:available_time, :slots)
    end   
    
    def get_schedule
        @schedule = Schedule.find(params[:schedule_id])
    end
    
    def get_service
        @service = @schedule.service
    end

    def get_category
        @category = @service.category
    end
    
    def ensure_frame_response
        redirect_to category_services_path(@category) unless turbo_frame_request?
    end
end
