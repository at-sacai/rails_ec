# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, uniq: true
      t.string :address, null: false
      t.string :address_2
      t.string :country, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
