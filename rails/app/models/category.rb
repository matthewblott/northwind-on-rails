class Category < ApplicationRecord
  validates :category_name, presence: true
  validates :description, presence: true
end
