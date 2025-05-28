class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :sku, presence: true, uniqueness: { case_sensitive: false }

  scope :ordered_by_name, -> { order(:name) }
end
