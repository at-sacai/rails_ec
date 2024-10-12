# frozen_string_literal: true

class Coupon < ApplicationRecord
  belongs_to :order, optional: true
  validates :code, presence: true, uniqueness: true, length: { is: 7 }
  validates :discount_price, presence: true, numericality: true
end
