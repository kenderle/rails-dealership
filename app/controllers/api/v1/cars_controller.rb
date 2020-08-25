class API::V1::CarsController < ApplicationController


    before_action :set_dealership, only: [:show, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]

        # List all cars
        def index
            @dealership = Dealership.all 
            render json: @dealership
        end
    
        # Get specific dealership with its cars
        def show
            @cars = Car.sort_by(dealership_id: params[:id])
            render json: { cars: @cars }
    
        end
    
        # Create car
        def create 
            @car = Car.new(car_params)
            if @car.save
                render json: @car
            else
                render json: @car.errors, status: :unprocessable_entity
            end
        end
    
        # Update car
        def update 
            if @car.update(car_params)
                render json: @car
            else
                render json: @car.errors, status: :unprocessable_entity
            end
        end
    
        # Delete car
        def destroy 
            @car.destroy
        end
    
        # Get our Amazon S3 keys for image uploads
        def get_upload_credentials
            @accessKey = ENV['S3_ACCESS']
            @secretKey = ENV['S3_SECRET']
            render json: { accessKey: @accessKey, secretKey: @secretKey }
        end
    
        private
        #Methods under private are only accessible within this controller, not outside of it
    
        def set_car
            @car = Car.find(params[:id])
        end
    
        def car_params
            params.require(:car).permit(:make, :model, :year, :color, :description, :price, :dealership_id, :cost, :image)
        end
end


