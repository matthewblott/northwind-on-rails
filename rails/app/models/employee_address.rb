class EmployeeAddress < ApplicationRecord
  belongs_to :employee
  belongs_to :address
  
  validates :employee_id, presence: true
  validates :address_id, presence: true

  scope :by_employee, ->(employee_id) { where(employee_id: employee_id) }

end
