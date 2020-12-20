module ApplicationHelper

    def correct_session_id?
        @logged_in ||= true if session[:admin_id] == 1
    end

    def logged_in?
        !!correct_session_id?
    end

end
