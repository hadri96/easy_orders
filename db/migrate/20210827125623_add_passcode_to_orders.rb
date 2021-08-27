class AddPasscodeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :passcode, :string
  end
end
