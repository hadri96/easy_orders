class AddIsConfirmedAndIsDeliveredToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :is_confirmed, :boolean, default: false
    add_column :orders, :is_delivered, :boolean, default: false
  end
end
