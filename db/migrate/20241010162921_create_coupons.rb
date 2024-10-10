class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code, null: false, unique: true
      t.integer :discount_price, null: false

      t.timestamps
    end
  end
end
