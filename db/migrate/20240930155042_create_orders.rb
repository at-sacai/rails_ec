class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name, null: false, presence: true
      t.string :last_name, null: false, presence: true
      t.string :email, null: false, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
      t.string :address, null: false, presence: true, uniqueness: true
      t.string :address_2
      t.string :country, null: false, presence: true
      t.string :state, null: false, presence: true
      t.string :zip, null: false, presence: true, format: { with: /^\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}$/s }
      t.integer :total_price, null: false, presence: true

      t.timestamps
    end
  end
end
