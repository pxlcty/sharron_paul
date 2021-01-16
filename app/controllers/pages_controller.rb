class PagesController < ApplicationController

    def home
        @bio = Detail.first
        @news_alert = NewsAlert.first
        @apply_alert = false
        if @news_alert.active && @news_alert.count_down > DateTime.now && Event.find_by(id: @news_alert.event_id)
            @event_alert = Event.find_by(id: @news_alert.event_id)
            @apply_alert = true
        end

        #@events = Event.last(3)
        #@events = Event.order(time: :asc).first(3)
        @events = Event.where('time > ?', Date.today).order(time: :asc).first(3)
        #@events = Event.where(time: Time.now.midnight - 15.day).order(time: :asc).first(3)
        #now_time = DateTime.now
        #@events = Event.where(:time > :now_time).first(3)
        
    end

    def about
        @bio = Detail.first
    end

    def media
        categories = MediaCategory.all
        @media_links = MediaLink.all
        @media_collections = MediaCollection.all
        @ranked_media = media_priority_list(@media_links, @media_collections, categories)
        @seasons = Season.all
        @episodes = Episode.all
        #byebug
    end

    private
        def media_priority_list (media_links, media_collections, categories)
            display_list = []
            build_priority_list(display_list, media_links, categories)
            build_priority_list(display_list, media_collections, categories)
            prio_list = display_list.sort { |a, b| b[2] <=> a[2] }
            prio_list
        end

        def build_priority_list (list, collection, categories)
            collection.each do |unit| 
                cat_id = categories.find unit.media_category_id.to_i
                media = [unit.id, cat_id.name, (unit.points + cat_id.points), unit.points, cat_id.points, unit.class.to_s]
                list.push(media)
            end
        end


end

# Comment.where(:created_at => @selected_date.beginning_of_day..@selected_date.end_of_day)
# @due_this_week = current_user.tasks.where(due_date: 1.week.ago..Date.today)

#some_date = Time.now
#Item.where("created_at >= :date OR updated_at >= :date", date: some_date.tomorrow.beginning_of_day)

#Model.where(needed_column: [Time.now.at_beginning_of_day, Time.now.end_of_day])
#Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
