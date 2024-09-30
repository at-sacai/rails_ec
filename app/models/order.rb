class Order < ApplicationRecord
  has_many :order_items, dependent: delete_all
  has_many :items, through: :ordered_items
end
