class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :ordered_items

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_ZIP_REGEX = /^\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}$/s
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  validates :address_2
  validates :country, presence: true
  validates :state, presence: true
  validates :zip, presence: true, format: { with: /^\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}$/s }
  t.integer :total_price, presence: true
end
