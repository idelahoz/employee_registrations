module Steps
  class BaseStep < ApplicationService
    def initialize(registration_id, user_attributes)
      @registration_id = registration_id
      @user_attributes = user_attributes
    end
  
    def call
      ensure_parameters!
      employee_registration.assign_attributes(filtered_attributes)
      employee_registration.save!
      employee_registration
    end
  
    private
  
    attr_reader :registration_id, :user_attributes

    def required_attributes
      raise "class #{self.class.name} must implement method required_attributes"
    end

    def accepted_attributes
      raise "class #{self.class.name} must implement method accepted_attributes"
    end

    def ensure_parameters!
      raise Errors::IncompleteParametersError.new("Attributes #{required_attributes.inspect} are neeeded") unless all_requirements_fulfilled?
    end

    def all_requirements_fulfilled?
      required_attributes.all? do |param_name|
        user_attributes[param_name].present?
      end
    end

    def employee_registration
      EmployeeRegistration.find(registration_id)
    end

    def filtered_attributes
      user_attributes.slice(accepted_attributes)
    end
  end
end