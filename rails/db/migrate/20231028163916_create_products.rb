class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_code, limit: 25
      t.string :product_name, limit: 50
      t.string :description, limit: 250
      t.decimal :standard_cost
      t.decimal :list_price
      t.boolean :discontinued
      t.timestamps
    end
  end
end
