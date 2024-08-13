class Product < ApplicationRecord
  before_save { self.product_code = product_code.upcase }
  validates :product_code, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 25}
  validates :product_name, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 250}
  validates :standard_cost, presence: true
  validates :list_price, presence: true

  scope :product_code_like, -> (query) { where("product_code LIKE ?", "%#{query}%") }
  scope :product_name_like, -> (query) { where("product_name LIKE ?", "%#{query}%") }
  scope :product_code_or_product_name_like, -> (query) { product_code_like(query).or(product_name_like(query)) }

  def self.name_like(q)
    products = product_code_or_product_name_like(q)
    products.uniq
  end

  has_many :order_items
end
