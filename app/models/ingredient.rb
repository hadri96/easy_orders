class Ingredient < ApplicationRecord
  belongs_to :items
  validates :name, presence: true
end
