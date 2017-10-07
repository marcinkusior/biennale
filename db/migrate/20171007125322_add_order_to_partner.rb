class AddOrderToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :order, :integer, deault: 0
  end
end
