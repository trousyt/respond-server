class AddUserIdToUserAttributes < ActiveRecord::Migration
  def change
    add_column :user_attributes, :user_id, :integer
    add_index :user_attributes, :user_id
  end
end
