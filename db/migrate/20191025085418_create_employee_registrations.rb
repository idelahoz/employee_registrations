class CreateEmployeeRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :gender
      t.string :trade
      t.string :skill_level
      t.string :ssn
      t.text :bio
      t.timestamps
    end
  end
end
