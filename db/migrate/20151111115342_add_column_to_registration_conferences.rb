class AddColumnToRegistrationConferences < ActiveRecord::Migration
  def change
    add_column :registration_conferences, :subject, :string
  end
end
