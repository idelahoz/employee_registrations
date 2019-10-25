module Steps
  class ThirdStep < BaseStep

    private

    def employee_registration
      EmployeeRegistration.new
    end

    def required_attributes
      [:ssn]
    end

    def accepted_attributes
      [:ssn, :bio]
    end
  end
end