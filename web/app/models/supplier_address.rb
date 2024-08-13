class SupplierAddress < ApplicationRecord
  belongs_to :supplier
  belongs_to :address
  
  validates :supplier_id, presence: true
  validates :address_id, presence: true

  scope :by_supplier, ->(supplier_id) { where(supplier_id: supplier_id) }

end
