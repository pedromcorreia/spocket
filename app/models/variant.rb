class Variant < ApplicationRecord
  belongs_to :product
  validates_inclusion_of :price, in: 0..999
  validates :size, :price, :inventory, presence: true
end
