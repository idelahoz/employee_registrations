module Steps
  class SecondStep < BaseStep

    private

    def employee_registration
      EmployeeRegistration.new
    end

    def required_attributes
      [:trade]
    end

    def accepted_attributes
      [:trade, :skill_level]
    end
  end
end