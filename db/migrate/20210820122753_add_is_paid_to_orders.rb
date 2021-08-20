class AddIsPaidToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :is_paid, :boolean, default: false
  end
end
