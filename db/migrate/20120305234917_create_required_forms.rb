class CreateRequiredForms < ActiveRecord::Migration
  def change
    create_table :required_forms do |t|
      t.string :name
      t.string :reference

      t.timestamps
    end
  end
end
