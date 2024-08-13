class ChangeEmployeeAddressesToAddressesEmployees < ActiveRecord::Migration[7.1]
  def change
    rename_table(:employee_addresses, :addresses_employees)
  end
end
