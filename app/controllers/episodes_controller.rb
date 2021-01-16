class EpisodesController < ApplicationController

    before_action :credentials_check

    def new
        @episode = Episode.new
        @episode.season_id = params[:season_id].to_i
        @season = Season.find(params[:season_id])
        @media_collection = MediaCollection.find(params[:media_collection_id])
    end

    def create
        clean_data = episode_params_ww
        episode_date = Date.new(
            clean_data.delete(:episode_year).to_i,
            clean_data.delete(:episode_month).to_i,
            clean_data.delete(:episode_day).to_i,
        )
        clean_data[:publication_date] = episode_date
        @episode = Episode.new(clean_data)
        if @episode.save
            flash[:notice] = "Episode was saved"
            redirect_to media_collections_path
        else
            render 'new'
        end
    end

    def destroy
        @episode = Episode.find(params[:id])
        @episode.destroy
        redirect_to media_collections_path
    end

    def edit
        @episode = Episode.find(params[:id])
        @season = Season.find(params[:season_id]) 
        @media_collection = MediaCollection.find(params[:media_collection_id])        
    end

    def update
        @episode = Episode.find(params[:id])
        clean_data = episode_params_ww
        episode_date = Date.new(
            clean_data.delete(:episode_year).to_i,
            clean_data.delete(:episode_month).to_i,
            clean_data.delete(:episode_day).to_i,
        )
        clean_data[:publication_date] = episode_date
        
        if @episode.update(clean_data)
            flash[:notice] = "Episode was updated"
            redirect_to media_collections_path
        else
            render 'edit'
        end
    end


    private 

    def episode_params_ww
        params.require(:episode).permit(
            :episode_name,
            :episode_number,
            :description,
            :description_link,
            :media_link,
            :season_id,
            :episode_year,
            :episode_month,
            :episode_day

        )
    end

    def credentials_check
        unless helpers.logged_in?
            flash[:alert] = "Credentials missing"
            redirect_to root_path
        end
    end

end