class AddIsBarmanToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_barman, :boolean, default:false
  end
end
