class AdminsController < ApplicationController

    def edit
        @admin = Admin.first
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