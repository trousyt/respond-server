class CreateItems < ActiveRecord::Migration
  def change
    create_table :item do |t|
      t.string :description
      t.binary :image
      t.string :image_mime

      t.timestamps
    end
  end
end
