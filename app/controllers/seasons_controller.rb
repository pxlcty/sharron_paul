class SeasonsController < ApplicationController

    def new
        @season = Season.new
        @season.media_collection_id = params[:media_collection_id].to_i
        @media_collection = MediaCollection.find(params[:media_collection_id])
        #byebug
    end

    def create
        @season = Season.new(season_params_ww)
        if @season.save
            redirect_to media_collections_path
        else
            render 'new'
        end

    end

    def edit
        @season = Season.find(params[:id])
        @media_collection = MediaCollection.find(params[:media_collection_id])
    end

    def update
        @media_collection = MediaCollection.find(params[:media_collection_id])
        @season = Season.find(params[:id])
        if @season.update(season_params_ww)
            flash[:notic] = "Season Was updated"
            redirect_to media_collections_path
        else
            render 'edit'
        end
    end

    def destroy
        @season = Season.find(params[:id])
        @season.destroy
        redirect_to media_collections_path
    end

    private 

    def season_params_ww
        params.require(:season).permit(
            :season_number,
            :year,
            :description,
            :media_collection_id
        )
    end
    
end