class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = Category.all
        @category = Category.new
    end

    def create
        Category.create(category_params)
        redirect_to categories_path
    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
    end
end
