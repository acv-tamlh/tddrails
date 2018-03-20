class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  validates_numericality_of :price, greater_than: 0
end
