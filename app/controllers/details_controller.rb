class DetailsController < ApplicationController

    def edit
        @detail = Detail.first
    end

    def update
        # do I need the params id? or can 'force' it to be Detail.first?
        @detail = Detail.find(params[:id])
        if @detail.update(detail_params_ww)
            flash[:notice] = "Details was successfully updated"
            redirect_to root_path
        else
            render 'edit'
        end
    end

    private
    def detail_params_ww
        params.require(:detail).permit(
            :headline,
            :about_bio,
            :home_bio,
            :inquiries_email,
            :home_image_url,
            :about_image_url,
            :inquiries_headline,
            :inquiries_body,
            :contact_email
        )
    end

end