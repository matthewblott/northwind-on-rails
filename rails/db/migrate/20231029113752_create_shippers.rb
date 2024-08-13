class CreateShippers < ActiveRecord::Migration[7.1]
  def change
    create_table :shippers do |t|
      t.string :company_name, limit: 50
      t.string :phone, limit: 50
      t.timestamps
    end
  end
end
