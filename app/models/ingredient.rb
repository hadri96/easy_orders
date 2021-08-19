class Ingredient < ApplicationRecord
  validates :name, presence: true
  has_many :ingredient_lists
  has_many :items, through: :ingredient_lists
end
