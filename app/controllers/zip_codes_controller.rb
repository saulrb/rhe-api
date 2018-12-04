class ZipCodesController < ApplicationController
    before_action :authenticate_user
    
    def index
        render json: { status: 200, msg: "Logged-in: #{current_user.username}"}
    end

    def find
        zip_code = params[:zip_code]
        zip = ZipCode.where(zip_code: zip_code).all().order(:location).pluck(:zip_code, :location, :county)
        if zip.present?
           render json: zip , status: 200, msg: 'success' 
        end
    end
end
