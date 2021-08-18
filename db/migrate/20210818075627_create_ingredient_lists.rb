class CreateIngredientLists < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_lists do |t|
      t.references :item, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
