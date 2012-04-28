class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :username
      t.string :email
      t.string :digest
      t.string :salt
      t.string :request_token
      t.integer :login_count
      t.integer :failed_login_count
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.string :last_request_ip
      t.string :last_login_ip

      t.timestamps
    end
  end
end
