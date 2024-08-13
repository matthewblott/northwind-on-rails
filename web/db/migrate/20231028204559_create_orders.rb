class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :employee_id
      t.string :customer_id
      t.datetime :order_date, precision: nil
      t.datetime :shipped_date, precision: nil
      t.integer :address_id
      t.decimal :shipping_fee, precision: 19, scale: 4, default: "0.0"
      t.string :payment_type, limit: 50
      t.datetime :paid_date, precision: nil
      t.string :order_status, limit: 25
      t.timestamps
    end
  end
end
