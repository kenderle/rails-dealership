class Api::V1::EmployeesController < ApplicationController

    skip_before_action :authenticate, only: [:login, :create]

    def login
        render json: { error: "User not authenticated" }, status: 401 and return unless @employee=EmployeesService.login(params[:username], params[:password])
        render json: @employee.profile, status: :ok
    end

    def create
        @employee = Employee.register(params[:position], params[:first_name], params[:last_name], params[:username], params[:password], params[:password_confirmation])
        render json: { error: "There was a problem saving your user" }, status: :unprocessable_entity and return unless @employee
        render json: @employee.profile, status: :ok
    end

    def logout
        render json: { error: "There was a problem logging out" }, status: :unprocessable_entity and return unless EmployeesService.logout(@current_user)
        render json: { success: "You have been successfully logged out" }, status: :ok
    end

    def me
        render json: @current_user.profile, status: :ok
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :username, :position, :password, :password_confirmation)
    end
end

