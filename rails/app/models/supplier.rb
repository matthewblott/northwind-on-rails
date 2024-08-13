class Supplier < ApplicationRecord
  validates :company_name, presence: true
  validates :contact_name, presence: true
  validates :contact_title, presence: true

  has_and_belongs_to_many :addresses, inverse_of: :suppliers

end
