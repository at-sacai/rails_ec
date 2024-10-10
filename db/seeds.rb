# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
value_seed = [*'a'..'z', *'0'..'9']
10.times do |_n|
  Coupon.create!(
    code: "#{value_seed.sample(8).join}",
    discount_price: Random.rand(100..1000)
  )
end
