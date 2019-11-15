class LinksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def new
        @link = Link.new
    end

    def create
        @link = current_user.links.build(link_params)
        @link.user_id = current_user.id
        if @link.save
            redirect_to link_path(@link), notice: "Link Successfully Created"
        else
            flash.now[:alert] = "Failed To Create Link"
            render :new
        end
    end

    def show
        @link = Link.find_by(id: params[:id])
    end

    def index
        @links = Link.all
    end

    private

    def link_params
        params.require(:link).permit(:title, :url, :category_title, :user_id)
    end
end
