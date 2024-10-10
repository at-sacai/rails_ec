class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount_price

      t.timestamps
    end
  end
end
