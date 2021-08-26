class AddItemQuantityToOrderLists < ActiveRecord::Migration[6.0]
  def change
    add_column :order_lists, :item_quantity, :integer, default: 0
  end
end
