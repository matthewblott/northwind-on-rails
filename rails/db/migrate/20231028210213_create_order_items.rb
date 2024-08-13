class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items, primary_key: [:order_id, :product_id] do |t|
      t.integer :order_id, null: false
      t.integer :product_id
      t.decimal :quantity, precision: 18, scale: 4, default: 0.0, null: false
      t.decimal :unit_price, precision: 19, scale: 4, default: 0.0
      t.float :discount, default: 0.0, null: false
      t.string :order_item_status, limit: 25
      t.datetime :date_allocated, precision: nil
      t.timestamps
    end
  end
end
