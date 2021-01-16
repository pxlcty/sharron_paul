class EventsController < ApplicationController

    def index
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
        breaking_news_alert = false
        ui_message = ""
        @news_alert = NewsAlert.last(1)
        clean_data = event_params_ww

        if clean_data[:alert_active] == "0"
            clean_data.delete(:alert_active)
            clean_data.delete(:alert_time)
        else
            breaking_news_alert = true
            #add or remove hours to DateTime with +/- (float-number / 24) 
            add_time = (clean_data.delete(:alert_time).to_f) / 24      
            datetime_from_now = DateTime.now + add_time
            clean_data.delete(:alert_active)
            @news_alert[0][:count_down] = datetime_from_now
            @news_alert[0][:active] = true;            
            ui_message = "Alert Need to be updated."
        end

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
                ui_message << " Event was created succesfully"
                if breaking_news_alert
                    @news_alert[0][:event_id] = @event.id
                    if @news_alert[0].save
                        ui_message << " Alert was updated."
                    end
                end

                flash[:notice] = ui_message
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
        breaking_news_alert = false
        ui_message = ""
        @event = Event.find(params[:id])
        @news_alert = NewsAlert.last(1)
        
        clean_data = event_params_ww
        if clean_data[:alert_active] == "0"
            if(@news_alert[0].event_id == @event.id)
                @news_alert[0][:active] = false;
                ui_message = "Alert to be removed."
            end
            clean_data.delete(:alert_active)
            clean_data.delete(:alert_time)            
        else
            breaking_news_alert = true
            add_time = (clean_data.delete(:alert_time).to_f) / 24            
            datetime_from_now = DateTime.now + add_time
            clean_data.delete(:alert_active)
            @news_alert[0][:event_id] = @event.id
            @news_alert[0][:count_down] = datetime_from_now
            @news_alert[0][:active] = true;            
            ui_message = "Alert To be activated."
        end

        
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
                
                ui_message << " Event was updated successfully."
                if @news_alert[0].save
                    
                    ui_message << " Alert status was updated."
                end
            #if @event.update(clean_data)
            #if @event.update(event_params_ww)
                flash[:notice] = ui_message
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
            :id,
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
            :location_country,
            :alert_active,
            :alert_time
        )
    end



end