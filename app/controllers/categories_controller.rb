class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_frame_response, only: [:new, :edit]

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id]).update(category_params)
        redirect_to categories_path
    end

    def create
        Category.create(category_params)
        redirect_to categories_path
    end

    def destroy
        @category = Category.find(params[:id]).destroy
        redirect_to categories_path
    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
    end

    def ensure_frame_response
        redirect_to categories_path unless turbo_frame_request?
    end
end
