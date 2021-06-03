class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :size
      t.float :price
      t.integer :inventory
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
