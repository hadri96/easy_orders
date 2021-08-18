class Item < ApplicationRecord
  belongs_to :orders, optional: true
  has_many :ingredient_lists
  has_many :ingredients, through: :ingredient_lists
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  #has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :item_price, presence: true
end
