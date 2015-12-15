class AddArchiveOnToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :archive_on, :boolean
  end
end
