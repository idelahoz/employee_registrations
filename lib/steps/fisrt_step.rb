module Steps
  class FirstStep < BaseStep

    private

    def employee_registration
      EmployeeRegistration.new
    end

    def required_attributes
      [:first_name, :last_name, :email]
    end

    def accepted_attributes
      [:first_name, :last_name, :phone, :email, :address, :gender]
    end
  end
end