class SessionsController < ApplicationController

    def new
    end

    def create
        admin = Admin.find_by(admin_name: params[:session][:admin_name])
        if admin && admin.authenticate(params[:session][:password])
            session[:admin_id] = admin.id
            flash[:notice] = "Logged in successfully"
            redirect_to root_path
        else 
            flash.now[:alert] = "There was something wrong with your login details"
            render 'new'
        end
    end

    def destroy
        session[:admin_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end