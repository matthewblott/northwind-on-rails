class CreateCustomerAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_addresses, primary_key: [:customer_id, :address_id] do |t|
      t.string :customer_id
      t.integer :address_id
      t.timestamps
    end
  end
end
