class MediaCategoriesController < ApplicationController

    before_action :credentials_check

    def index
        @media_categories = MediaCategory.all
    end

    def new
        @media_category = MediaCategory.new
    end

    def create
        @media_category = MediaCategory.new(media_category_params_ww)
        if @media_category.save
            redirect_to media_categories_path
        else
            render 'new'
        end
    end

    def edit
        @media_category = MediaCategory.find(params[:id])
    end

    def update
        @media_category = MediaCategory.find(params[:id])
        if @media_category.update(media_category_params_ww)
            flash[:notice] = "Media Category was updated."
            redirect_to media_categories_path
        else
            render 'edit'
        end
    end

    def destroy
        @media_category = MediaCategory.find(params[:id])
        @media_category.destroy
        redirect_to media_categories_path
    end

    private

    def media_category_params_ww
        params.require(:media_category).permit(:name, :points)
    end

    def credentials_check
        unless helpers.logged_in?
            flash[:alert] = "Credentials missing"
            redirect_to root_path
        end
    end
    
end