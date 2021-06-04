class Product < ApplicationRecord
  has_many :variants
  belongs_to :user
  has_many :product_attachments
  accepts_nested_attributes_for :product_attachments
end
