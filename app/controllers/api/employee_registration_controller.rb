class Api::EmployeeRegistrationController < ApplicationController
  rescue_from Errors::IncompleteParametersError, with: :deny_access # self defined exception
  rescue_from ActiveRecord::RecordInvalid, with: :show_errors
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def create
    registration = EmployeeRegistrationService.call(
      registration_id: params[:id], 
      registration_attributes: employee_registration_params.to_h, 
      step: params['step'].to_sym)

    render json: { registration_id: registration.id, sucess: true }, status: 200 
  end

  private

  def employee_registration_params
    params.require(:employee_registration).permit(
      :first_name, :last_name, :phone, :email, :address, :gender, :trade, :skill_level, :ssn, :bio)
  end

  def show_errors(exception)
    render json: { error: exception.message }, status: 502 
  end

  def not_found(exception)
    render json: { error: "Unknown registration" }, status: 404 
  end
end
