class MediaCollectionsController < ApplicationController

    before_action :credentials_check, except: [:show]

    def show
        @media_collection = MediaCollection.find(params[:id])
        @category = MediaCategory.find(@media_collection.media_category_id)
        @seasons = Season.where(media_collection_id: @media_collection.id)
        season_ids_arr = @seasons.map(&:id)
        @episodes = Episode.where(season_id: season_ids_arr)
        #byebug
    end

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

    def destroy
        @media_collection = MediaCollection.find(params[:id])
        @media_collection.destroy
        redirect_to media_collections_path
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