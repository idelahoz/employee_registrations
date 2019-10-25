class EmployeeRegistrationService < ApplicationService
  def initialize(registration_id:, registration_attributes:, step:)
    @registration_id = registration_id
    @registration_attributes = registration_attributes
    @step = step
  end

  def call
    steps[step.to_sym].call(registration_id, registration_attributes)
  end

  private

  attr_reader :registration_id, :registration_attributes, :step

  def steps
    @steps ||= {
      one: Steps::FirstStep,
      two: Steps::SecondStep,
      three: Steps::ThirdStep,
      submit: Steps::SubmitStep,
    }
  end
end