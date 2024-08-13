class CustomerAddress < ApplicationRecord
  belongs_to :customer
  belongs_to :address

  validates :customer_id, presence: true
  validates :address_id, presence: true

  # accepts_nested_attributes_for :address
  # validates_associated :address

  scope :by_customer, -> (customer_id) { where(customer_id: customer_id) }
end
