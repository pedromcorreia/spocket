class ProductAttachment < ApplicationRecord
  mount_uploader :photo, ImageUploader
  belongs_to :product
end
