# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

coupons = { wKEXS7O: 500, wBNVBLe: 1000, xlYEXoz: 300, V86ivwR: 500, LrE7ZXg: 1000 }

coupons.each do |_coupon_code, _discount_price|
  Coupon.create!(
    code: _coupon_code,
    discount_price: _discount_price
  )
end
