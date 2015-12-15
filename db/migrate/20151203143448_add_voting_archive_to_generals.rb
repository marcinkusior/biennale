class AddVotingArchiveToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :contest_archive_id, :integer
  end
end
