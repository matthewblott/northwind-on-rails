class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :name, limit: 50 
      t.string :address_line_1, limit: 100
      t.string :address_line_2, limit: 100
      t.string :postal_town, limit: 100
      t.string :county, limit: 100
      t.string :post_code, limit: 10
      t.string :country, limit: 100
      t.timestamps
    end
  end
end
