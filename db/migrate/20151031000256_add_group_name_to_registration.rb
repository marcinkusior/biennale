class AddGroupNameToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :group_name, :string
  end
end
