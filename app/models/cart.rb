class Cart < ApplicationRecord
  has_many :cart_items, dependent: :delete_all
  has_many :items, through: :cart_items
end
