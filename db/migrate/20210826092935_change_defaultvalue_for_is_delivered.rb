class ChangeDefaultvalueForIsDelivered < ActiveRecord::Migration[6.0]
  def change
    change_column_default :orders, :is_delivered, false
    change_column_default :orders, :is_confirmed, false
  end
end
