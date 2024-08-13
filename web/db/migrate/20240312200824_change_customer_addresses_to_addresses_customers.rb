class ChangeCustomerAddressesToAddressesCustomers < ActiveRecord::Migration[7.1]
  def change
    rename_table(:customer_addresses, :addresses_customers)
  end
end
