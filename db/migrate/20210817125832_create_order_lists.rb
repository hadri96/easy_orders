class CreateOrderLists < ActiveRecord::Migration[6.0]
  def change
    create_table :order_lists do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
