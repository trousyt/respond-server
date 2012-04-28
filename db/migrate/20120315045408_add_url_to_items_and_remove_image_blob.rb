class AddUrlToItemsAndRemoveImageBlob < ActiveRecord::Migration
  def change
    remove_column :items, :image
    add_column :items, :image1x_url, :string
    add_column :items, :image2x_url, :string
  end
end
