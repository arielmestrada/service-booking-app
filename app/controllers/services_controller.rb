class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category
  before_action :get_service, only: [:edit, :update, :destroy]
  before_action :ensure_frame_response, only: [:new, :edit]

  def index
    @services = @category.services
  end
  
  def new
    @service = @category.services.new
  end
  
  def edit
  end

  def create
    @service = @category.services.create(service_params)
    redirect_to category_services_path(params[:category_id])
  end

  def update
    @service.update(service_params)
    redirect_to category_services_path(params[:category_id])
  end

  def destroy
    @service.destroy
    redirect_to category_services_path(params[:category_id])
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :price)
  end

  def get_category
    @category = Category.find(params[:category_id])
  end

  def get_service
    @service = @category.services.find(params[:id])
  end

  def ensure_frame_response
    redirect_to category_services_path(@category) unless turbo_frame_request?
  end

end
