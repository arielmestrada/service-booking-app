class SchedulesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_service, :get_category
    before_action :ensure_frame_response, only: [:new, :edit]
      
    def new
        @schedule = @service.schedules.new
    end
    
    def edit
        @schedule = Schedule.find(params[:id])
    end
  
    def create
        @schedule = @service.schedules.create(schedule_params)
        redirect_to category_services_path(params[:category_id])
    end
  
    def update
        @schedule = @service.schedules.update(schedule_params)
        redirect_to category_services_path(params[:category_id])
    end
  
    def destroy
        @schedule = Schedule.find(params[:id]).destroy
        redirect_to category_services_path(params[:category_id])
    end
  
    private
  
    def schedule_params
        params.require(:schedule).permit(:available_date)
    end    
  
    def get_service
        @service = Service.find(params[:service_id])
    end

    def get_category
        @category = @service.category
    end
  
    def ensure_frame_response
        redirect_to category_services_path(@category) unless turbo_frame_request?
    end
end
