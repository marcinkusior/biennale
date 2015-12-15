class AddTitleAndTitlePlToRecors < ActiveRecord::Migration
  def change
    add_column :records, :title, :string
    add_column :records, :titlePL, :string
  end
end
