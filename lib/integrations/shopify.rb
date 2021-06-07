require 'shopify_api'
module Integrations
  class Shopify
    def initialize(supplier_id, kind)
      supplier = Supplier.find(supplier_id)
      integration_store = supplier.integration_stores.find_by!(kind: kind)

      shop_url = "https://#{integration_store.api_key}:#{integration_store.password}@#{integration_store.store_name}.myshopify.com"
      ShopifyAPI::Base.site = shop_url
      ShopifyAPI::Base.api_version = '2020-01'
    end

    def call
      ShopifyAPI::Product.find(:all)
    end
  end
end
