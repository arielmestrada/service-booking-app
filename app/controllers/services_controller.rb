class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category

  def index
    @services = @category.services
    @service = Service.new
  end

  def create
    @service = @category.services.create(service_params)
    redirect_to category_services_path(params[:category_id])
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :price)
  end

  def get_category
    @category = Category.find(params[:category_id])
  end

end
