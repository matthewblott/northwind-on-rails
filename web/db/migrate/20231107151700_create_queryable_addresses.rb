class CreateQueryableAddresses < ActiveRecord::Migration[7.1]
  def change
    create_view :queryable_addresses
  end
end
