class PagesController < ApplicationController

    def home
        @bio = Detail.first
        @events = Event.last(3)
    end

    def about
        @bio = Detail.first
    end

end