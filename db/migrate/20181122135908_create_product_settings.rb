class CreateProductSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :product_settings do |t|
      t.references :product, foreign_key: true, null: false
      t.float :price_limit, null: false
      t.timestamps
    end
  end
end
