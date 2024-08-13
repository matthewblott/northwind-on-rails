class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product_id, :order_id, :quantity, presence: true
  validates :product_id, uniqueness: {scope: :order_id}

  scope :by_order, -> (order_id) { where(order_id: order_id) }

end
