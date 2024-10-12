class Coupon < ApplicationRecord
  belongs_to :order
  valiadate :code, uniqueness: true, length: { is: 7 }
  validates :discount_price, numericality: true
end
