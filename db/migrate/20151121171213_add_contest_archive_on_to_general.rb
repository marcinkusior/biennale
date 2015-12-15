class AddContestArchiveOnToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :contest_archive_on, :boolean
  end
end
