class Item < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [450, 300]
    attachable.variant :max, resize_to_limit: [600,700]
  end
end
