class Product < ApplicationRecord
  searchkick word_middle: [:name]
  has_many :variants
  belongs_to :user
  belongs_to :supplier, class_name: 'Supplier', foreign_key: 'user_id'
  has_many :product_attachments
  accepts_nested_attributes_for :product_attachments
end
