class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def create
        @category = current_user.categories.build(category_params)
        if @category.save
            redirect_to category_path(@category), notice: "Category successfully created"
        else
            flash.now[:alert] = "Failed to create Category"
            render :new
        end
    end

    def edit
        @category = Category.find_by(id: params[:id])
    end

    def update
        @category = Category.find_by(id: params[:id])
        if @category.update(category_params)
            redirect_to category_path(@category), notice: "Category successfully created"
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

    def destroy
        @category = Category.find_by(id: params[:id])
        if current_user.categories.include?(@category)
            @category.destroy
            redirect_back(fallback_location: root_path)
        else
            flash.now[:alert] = "You are not authorized to delete this Category"
            redirect_back(fallback_location: root_path)
        end
    end

    private

    def category_params
        params.require(:category).permit(:title, :user_id)
    end
end
