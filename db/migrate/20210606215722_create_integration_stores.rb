class CreateIntegrationStores < ActiveRecord::Migration[6.0]
  def change
    create_table :integration_stores do |t|
      t.string :kind
      t.string :store_name
      t.string :api_key
      t.string :password
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
