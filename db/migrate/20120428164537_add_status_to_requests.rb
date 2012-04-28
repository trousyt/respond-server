class AddStatusToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :status, :string, :default => 'Pending'
  end
end
