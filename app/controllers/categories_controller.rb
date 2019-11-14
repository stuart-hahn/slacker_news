class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to category_path(@category)
        else
            render :new, alert: "Failed to create Category"
        end
    end

    def show
        @category = Category.find_by(id: params[:id])
    end

    def index
        @categories = Category.all
    end

    private

    def category_params
        params.require(:category).permit(:title)
    end
end
