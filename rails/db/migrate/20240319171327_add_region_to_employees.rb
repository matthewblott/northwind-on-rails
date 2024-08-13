class AddRegionToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_reference(:employees, :region, null: true, foreign_key: true)
  end
end
