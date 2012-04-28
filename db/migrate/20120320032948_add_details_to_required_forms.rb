class AddDetailsToRequiredForms < ActiveRecord::Migration
  def change
    add_column :required_forms, :details, :string
    rename_column :required_forms, :reference, :ownedBy
  end
end
