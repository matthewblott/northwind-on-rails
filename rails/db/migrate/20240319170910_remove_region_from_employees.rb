class RemoveRegionFromEmployees < ActiveRecord::Migration[7.1]
  def change
    remove_column :employees, :region, :string
  end
end
