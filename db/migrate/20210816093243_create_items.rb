class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :item_price
      t.string :item_description

      t.timestamps
    end
  end
end
