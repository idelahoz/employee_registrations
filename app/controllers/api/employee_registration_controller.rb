class Api::EmployeeRegistrationController < ApplicationController
  def create
    EmployeeRegistrationService.call(
      registration_id: params[:id], 
      registration_attributes: employee_registration_params.to_h, 
      step: params['step'].to_sym)
  end

  private

  def employee_registration_params
    params.require(:employee_registration).permit(
      :first_name, :last_name, :phone, :email, :address, :gender, :trade, :skill_level, :ssn, :bio)
  end
end
