class AddPictureUrlToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :picture_url, :string
  end
end
