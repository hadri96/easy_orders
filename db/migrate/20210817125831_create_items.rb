class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :item_price
      t.text :item_description

      t.timestamps
    end
  end
end
