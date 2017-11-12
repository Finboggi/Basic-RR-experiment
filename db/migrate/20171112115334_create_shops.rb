class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name, unique: true, null: false
      t.string :url, unique: true, null: false

      t.timestamps
    end
  end
end
