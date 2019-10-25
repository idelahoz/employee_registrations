class EmployeeRegistration < ApplicationRecord
  validates :my_email_attribute, email: true
end
