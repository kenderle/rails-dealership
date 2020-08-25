class API::V1::DealershipsController < ApplicationController::API

    before_action :set_dealership, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

        # List all dealerships
        def index
            @dealership = Dealership.all 
            render json: @dealership
        end
    
        # Get specific dealership with its cars
        def show
            @cars = Car.where(dealership_id: params[:id])
            render json: { dealership: @dealership, cars: @cars }
    
        end
    
        # Create dealership
        def create 
            @dealership = Dealership.new(dealership_params)
            if @dealership.save
                render json: @dealership
            else
                render json: @dealership.errors, status: :unprocessable_entity
            end
        end
    
        # Update dealership
        def update 
            if @dealership.update(dealership_params)
                render json: @dealership
            else
                render json: @dealership.errors, status: :unprocessable_entity
            end
        end
    
        # Delete dealership
        def destroy 
            @dealership.destroy
        end
    
        # Get our Amazon S3 keys for image uploads
        def get_upload_credentials
            @accessKey = ENV['S3_ACCESS']
            @secretKey = ENV['S3_SECRET']
            render json: { accessKey: @accessKey, secretKey: @secretKey }
        end
    
        private
        #Methods under private are only accessible within this controller, not outside of it
    
        def set_dealership
            @dealership = Dealership.find(params[:id])
        end
    
        def dealership_params
            params.require(:dealership).permit(:title, :phone, :street1, :street2, :city, :state, :zip_code)
        end
end
