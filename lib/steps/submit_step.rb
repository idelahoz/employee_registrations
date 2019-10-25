module Steps
  class SubmitStep < BaseStep

    def call
      check_for_completion!

      employee_registration.update(completed: true)
      Employee.create!(employe_attributes)
    end

    private

    def required_attributes
      [:first_name, :last_name, :email, :trade, :ssn]
    end

    def accepted_attributes
      []
    end

    def check_for_completion!
      raise Errors::IncompleteParametersError.new("Attributes #{required_attributes.inspect} are neeeded") unless employee_fields_filled?
    end

    def employee_fields_filled?
      required_attributes.all? do |param_name|
        employee_registration.send(param_name).present?
      end
    end

    def employe_attributes
      {
        first_name: employee_registration.first_name,
        last_name: employee_registration.last_name,
        phone: employee_registration.phone,
        email: employee_registration.email,
        address: employee_registration.address,
        gender: employee_registration.gender,
        trade: employee_registration.trade,
        skill_level: employee_registration.skill_level,
        ssn: employee_registration.ssn,
        bio: employee_registration.bio
      }
    end
  end
end