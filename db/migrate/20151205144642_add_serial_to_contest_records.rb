class AddSerialToContestRecords < ActiveRecord::Migration
  def change
    add_column :contest_records, :serial, :string
  end
end
