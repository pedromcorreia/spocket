module Integrations
  class Integrations
    def initialize(supplier_id, kind)
      @supplier = Supplier.find(supplier_id)
      @kind = kind
    end

    def call
      products = find_products.call
      save_products(products)
    end

    private

    def find_products
      case @kind
      when 'shopify'
        Adapters::Shopify.new(@supplier)
      else
        raise StandardError, 'Unsuported store'
      end
    end

    def save_products(products)
      products.each do |product|
        current_product = Product.find_by(external_id: product.id, user_id: @supplier.id)
        if current_product
          current_product.update(name: product.title)
        else
          Product.create(name: product.title, external_id: product.id, user_id: @supplier.id)
        end
      end
    end
  end
end
