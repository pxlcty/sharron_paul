class MediaCollectionsController < ApplicationController

    before_action :credentials_check

    def index
        @categories = MediaCategory.all
        @media_collections = MediaCollection.all
        @seasons = Season.all
        @episodes = Episode.all
    end

    def new
        @categories = MediaCategory.all
        @media_collection = MediaCollection.new
    end

    def create
        @media_collection = MediaCollection.new(media_collection_params_ww)
        if @media_collection.save
            redirect_to media_collections_path
        else
            render 'new'
        end
    end

    def edit
        @categories = MediaCategory.all
        @media_collection = MediaCollection.find(params[:id])
    end

    def update
        @media_collection = MediaCollection.find(params[:id])
        if @media_collection.update(media_collection_params_ww)
            flash[:notice] = "Media Collection was updated."
            redirect_to media_collections_path
        else
            render 'edit'
        end
    end


    private
    
    def media_collection_params_ww
        params.require(:media_collection).permit(
            :image_url,
            :headline,
            :year,
            :description,
            :points,
            :media_category_id
        )
    end

    def credentials_check
        unless helpers.logged_in?
            flash[:alert] = "Credentials missing"
            redirect_to root_path
        end
    end

end