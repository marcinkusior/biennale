class AddOrderPositionToContestRecords < ActiveRecord::Migration
  def change
    add_column :contest_records, :order_position, :integer
  end
end
