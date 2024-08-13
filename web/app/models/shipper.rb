class Shipper < ApplicationRecord
  validates :company_name, presence: true
  validates :phone, presence: true
end
