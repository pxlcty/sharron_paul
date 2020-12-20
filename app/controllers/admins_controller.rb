class AdminsController < ApplicationController

    def show
        if helpers.logged_in?
            @admin = Admin.first
        else
            flash[:alert] = "Need to be logged in admin to access that page BEEEE-AITCH!!"
            redirect_to root_path
        end
    end

    def edit
        if helpers.logged_in?
            @admin = Admin.first
        else
            flash[:alert] = "Need to be logged in admin to access that page BEEEE-AITCH!!"
            redirect_to root_path
        end
    end

    def update
        @admin = Admin.first
        if @admin.update(admin_params_ww)
            flash[:notice] = "Admin account information was successfully updated"
            redirect_to root_path
        else
            render 'edit'
        end
    end

    private
    def admin_params_ww
        params.require(:admin).permit(:admin_name, :email, :password)
    end

end