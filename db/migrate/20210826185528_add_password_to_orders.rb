class AddPasswordToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :password, :string
  end
end
