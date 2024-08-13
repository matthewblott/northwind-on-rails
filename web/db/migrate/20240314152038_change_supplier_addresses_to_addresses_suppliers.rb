class ChangeSupplierAddressesToAddressesSuppliers < ActiveRecord::Migration[7.1]
  def change
    rename_table(:supplier_addresses, :addresses_suppliers)
  end
end
