class LinksController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]

    def new
        @link = Link.new
    end
end
