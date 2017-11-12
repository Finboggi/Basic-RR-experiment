class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.references :product, foreign_key: true, null: false
      t.string :url, unique: true, null: false
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end

    add_index :links, [:product_id, :shop_id], unique: true
  end
end
