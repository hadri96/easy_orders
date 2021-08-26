class AddInPreparationToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :in_preparation, :boolean, default: false
  end
end
