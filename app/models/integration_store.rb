class IntegrationStore < ApplicationRecord
  belongs_to :supplier, class_name: 'Supplier', foreign_key: 'user_id'

  def self.kinds
    [:shopify]
  end

end
