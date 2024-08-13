class CreateRegions < ActiveRecord::Migration[7.1]
  def change
    create_table :regions do |t|
      t.string :name, null: false, limit: 50
      t.timestamps
    end
  end
end
