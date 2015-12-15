class RenamingColumns < ActiveRecord::Migration
  def change
  	rename_column :registrations, :last_Name, :last_name
  	rename_column :registrations, :University, :university
  	rename_column :registrations, :supervisor_proffesor, :supervising_professor
  	rename_column :registrations, :terms_of_servie, :terms_of_service
  end
end
