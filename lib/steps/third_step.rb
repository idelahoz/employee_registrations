module Steps
  class ThirdStep < BaseStep

    private

    def required_attributes
      [:ssn]
    end

    def accepted_attributes
      [:ssn, :bio]
    end
  end
end