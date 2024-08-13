class CreateSupplierAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :supplier_addresses, primary_key: [:supplier_id, :address_id] do |t|
      t.integer :supplier_id
      t.integer :address_id

      t.timestamps
    end
  end
end
