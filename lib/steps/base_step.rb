module Steps
  class BaseStep < ApplicationService
    def initialize(registration_id, user_attributes)
      @registration_id = registration_id
      @user_attributes = user_attributes
    end
  
    def call
      raise "Must implement a call method in class #{self.class.name}"
    end
  
    private
  
    attr_reader :registration_id, :user_attributes
  end
end