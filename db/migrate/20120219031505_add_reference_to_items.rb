class AddReferenceToItems < ActiveRecord::Migration
  def change
    add_column :item, :request_id, :integer
    add_index :item, :request_id
  end
end
