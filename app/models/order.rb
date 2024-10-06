class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
