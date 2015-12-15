class RenameFirstNameColumnToFirstName < ActiveRecord::Migration
  def change
  	rename_column :registrations, :first_Name, :first_name
  end
end
