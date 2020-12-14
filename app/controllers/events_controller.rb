class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params_ww)
        byebug
        if @event.save
            flash[:notice] = "Event was created succesfully"
            redirect_to @event
        else 
            render 'new'
        end

    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params_ww)
            flash[:notice] = "Event was updated successfully"
            redirect_to @event
        else 
            render 'edit'
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to events_path
    end

    private
    def event_params_ww
        params.require(:event).permit(
            :image_url,
            :headline, 
            :description_long, 
            :description_short,
            :time,
            :tickets_url,
            :map_url,
            :location_name,
            :location_url,
            :location_street,
            :location_city,
            :location_zip,
            :location_state,
            :location_country
        )
    end


end