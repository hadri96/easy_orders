class IngredientList < ApplicationRecord
  belongs_to :item
  belongs_to :ingredient
end
