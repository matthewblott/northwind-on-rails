class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :company_name, limit: 50
      t.string :contact_name, limit: 50
      t.string :contact_title, limit: 50
      t.string :region, limit: 50
      t.string :phone, limit: 50
      t.string :fax, limit: 50
      t.string :homepage, limit: 250
      t.timestamps
    end
  end
end
