class MediaLinksController < ApplicationController

    def index
        @categories = MediaCategory.all
        @media_links = MediaLink.all
        #byebug
    end

    def new
        @categories = MediaCategory.all
        @media_link = MediaLink.new
    end

    def create
        @media_link = MediaLink.new(media_link_params_ww)
        #byebug
        if @media_link.save
            redirect_to media_links_path
        else
            render 'new'
        end
    end
    
    def edit
        @categories = MediaCategory.all
        @media_link = MediaLink.find(params[:id])
    end

    def update
        @media_link = MediaLink.find(params[:id])
        if @media_link.update(media_link_params_ww)
            flash[:notice] = "Media Link was updated."
            redirect_to media_links_path
        else
            render 'edit'
        end
    end

    private

    def media_link_params_ww
        params.require(:media_link).permit(
            :image_url,
            :headline,
            :year,
            :description,
            :description_link,
            :media_link,
            :points,
            :media_category_id
        )
    end

end