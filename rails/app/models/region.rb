class Region < ApplicationRecord
  validates :name, presence: true
  scope :name_like, -> (query) { where("name LIKE ?", "%#{query}%") }
end
