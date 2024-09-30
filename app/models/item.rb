# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  image       :string
#  name        :string           not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Item < ApplicationRecord
  has_many :cart_items, dependent: :delete_all
  has_many :carts, through: :cart_items
  has_many :order_items, dependent: :delete_all
  has_many :orders, through: :order_items
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [450, 300]
    attachable.variant :max, resize_to_limit: [600, 700]
  end
end
