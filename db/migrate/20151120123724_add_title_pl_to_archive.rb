class AddTitlePlToArchive < ActiveRecord::Migration
  def change
    add_column :archives, :titlePL, :string
  end
end
