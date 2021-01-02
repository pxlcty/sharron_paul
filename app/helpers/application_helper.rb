module ApplicationHelper

    def correct_session_id?
        @logged_in ||= true if session[:admin_id] == 1
    end

    def logged_in?
        !!correct_session_id?
    end

    def site_datetime_writeout(pointInTime)
        # Weekday, month day year at 12hr:Minutes AM/PM
        pointInTime.strftime("%a, %b %d %Y at %I:%M %p")
    end

end
