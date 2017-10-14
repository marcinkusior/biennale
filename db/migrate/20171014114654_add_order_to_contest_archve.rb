class AddOrderToContestArchve < ActiveRecord::Migration
  def change
    add_column :contest_archives, :order, :integer, default: 0
    add_column :archives, :order, :integer, default: 0
  end
end
