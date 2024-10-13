# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.references :order, foreign_key: true
      t.string :code, null: false
      t.integer :discount_price, null: false

      t.timestamps
    end
    add_index :coupons, [:code], unique: true
  end
end
