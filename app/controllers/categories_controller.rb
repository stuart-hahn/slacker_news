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

    def edit
        @category = Category.find_by(id: params[:id])
    end

    def update
        @category = Category.find_by(id: params[:id])
        if @category.update(category_params)
            redirect_to category_path(@category)
        else
            render :edit, alert: "Failed to edit Category"
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
