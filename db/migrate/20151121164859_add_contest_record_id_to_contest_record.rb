class AddContestRecordIdToContestRecord < ActiveRecord::Migration
  def change
    add_column :contest_records, :contest_archive_id, :integer
  end
end
