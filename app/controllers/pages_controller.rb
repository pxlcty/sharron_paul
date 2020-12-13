class PagesController < ApplicationController

    def home
        @bio = Detail.first
        @events = Event.last(3)
    end

    def about
    end

end