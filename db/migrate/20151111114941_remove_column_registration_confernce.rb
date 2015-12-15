class RemoveColumnRegistrationConfernce < ActiveRecord::Migration
  def change
  	remove_column :registration_conferences, :supervising_professor
  	remove_column :registration_conferences, :group_name
  end
end
