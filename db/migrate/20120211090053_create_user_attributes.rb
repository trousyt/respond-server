class CreateUserAttributes < ActiveRecord::Migration
  def change
    create_table :user_attributes do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone

      t.timestamps
    end
  end
end
