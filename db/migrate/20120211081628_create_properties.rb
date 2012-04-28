class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
