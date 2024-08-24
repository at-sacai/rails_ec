# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env == 'development'
  item_1 = Item.create!(
  name: "1",
  price: 1,
  description: "数字の「1」です。",
  )
  item_1.image.attach(io: File.open(Rails.root.join('app/assets/images/1.png')),filename: '1.png')
  item_1.save!
  item_2 = Item.create!(
  name: "2",
  price: 2,
  description: "数字の「2」です。",
  )
  item_2.image.attach(io: File.open(Rails.root.join('app/assets/images/2.png')),filename: '2.png')
  item_2.save!
  item_3 = Item.create!(
  name: "3",
  price: 3,
  description: "数字の「3」です。",
  )
  item_3.image.attach(io: File.open(Rails.root.join('app/assets/images/3.png')),filename: '3.png')
  item_3.save!
  item_4 = Item.create!(
  name: "4",
  price: 4,
  description: "数字の「4」です。",
  )
  item_4.image.attach(io: File.open(Rails.root.join('app/assets/images/4.png')),filename: '4.png')
  item_4.save!
end
