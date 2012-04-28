class CreateRequests < ActiveRecord::Migration
  def change
    create_table :request do |t|
      t.references :user
      t.references :property
      t.string :required_forms
      t.string :other_notes

      t.timestamps
    end
    add_index :requests, :user_id
    add_index :requests, :property_id
  end
end
