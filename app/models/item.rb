class Item < ApplicationRecord
  belongs_to :orders
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :item_price, presence: true
  validates :item_description, presence: true
end
