class Store < ApplicationRecord
  belongs_to :retailer, class_name: 'Retailer', foreign_key: 'user_id'
  has_many :products
end
