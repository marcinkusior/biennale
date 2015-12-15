class AddBodyPlToRecord < ActiveRecord::Migration
  def change
    add_column :records, :bodyPL, :text
  end
end
