class UpdateQueryableAddressesToVersion3 < ActiveRecord::Migration[7.1]
  def change
    update_view(:queryable_addresses, version: 3, revert_to_version: 2)
  end
end
