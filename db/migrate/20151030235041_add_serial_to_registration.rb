class AddSerialToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :serial, :string
  end
end
