class AddExternalIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :external_id, :string
  end
end
