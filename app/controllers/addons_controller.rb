class AddonsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_service, :get_category
    before_action :ensure_frame_response, only: [:new, :edit]
        
    def new
        @addon = @service.addons.new
    end
    
    def edit
        @addon = Addon.find(params[:id])
    end
    
    def create
        @addon = @service.addons.create(addon_params)
        redirect_to category_services_path(params[:category_id])
    end
    
    def update
        @addon = @service.addons.update(addon_params)
        redirect_to category_services_path(params[:category_id])
    end
    
    def destroy
        @addon = Addon.find(params[:id]).destroy
        redirect_to category_services_path(params[:category_id])
    end
    
    private
    
    def addon_params
        params.require(:addon).permit(:name, :description, :price)
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
