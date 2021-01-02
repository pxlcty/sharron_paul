class EventsController < ApplicationController

    def index
        #@events = Event.paginate(page: params[:page], per_page: 5)
        #@events = Event.all.paginate(:order => "created_at DESC",:page => params[:page],:per_page => 5)
        #@events = Event.where('time > ?', Date.today).order(time: :asc).first(3)
        # this only shows today and any future date : 
        @events = Event.where('time > ?', Date.today).order(time: :desc).paginate(page: params[:page], per_page: 5)
    end

    def archive
        @events = Event.where('time < ?', Date.today).order(time: :desc).paginate(page: params[:page], per_page: 5)
        
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        broke = false #used as a flag if errors occur
        clean_data = event_params_ww

        #event_time = pull_datetime_field_from_form
        begin
            event_time = DateTime.new(
                clean_data.delete(:event_year).to_i, 
                clean_data.delete(:event_month).to_i, 
                clean_data.delete(:event_day).to_i, 
                clean_data.delete(:event_hour).to_i, 
                clean_data.delete(:event_minute).to_i
                )
        rescue
            flash.now[:warning] = "Something was wrong with your date format."
            render 'new' 
            broke = true
        end
        clean_data[:time] = event_time
                
        unless broke
            #@event = Event.new(event_params_ww)
            @event = Event.new(clean_data)            
            if @event.save
                flash[:notice] = "Event was created succesfully"
                redirect_to @event
            else 
                render 'new'
            end
        end

    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        broke = false #used as a flag if errors occur
        @event = Event.find(params[:id])
        clean_data = event_params_ww

        begin
            event_time = DateTime.new(
                clean_data.delete(:event_year).to_i, 
                clean_data.delete(:event_month).to_i, 
                clean_data.delete(:event_day).to_i, 
                clean_data.delete(:event_hour).to_i, 
                clean_data.delete(:event_minute).to_i
                )
        rescue
            flash.now[:warning] = "Something was wrong with your date format."
            render 'edit' 
            broke = true
        end
        clean_data[:time] = event_time

       unless broke
            if @event.update(clean_data)
            #if @event.update(event_params_ww)
                flash[:notice] = "Event was updated successfully"
                redirect_to @event
            else 
                render 'edit'
            end
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
            :event_year,
            :event_month,
            :event_day,
            :event_hour,
            :event_minute,
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

    def create_datetime_object_from_view
        
    end


end