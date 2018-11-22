# frozen_string_literal: true

class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.references :link, foreign_key: true, null: false, index: true
      t.datetime :parsed_at, null: false
      t.float :value, null: false

      t.timestamps
    end

    add_index :prices, %i[link_id parsed_at], unique: true
  end
end
