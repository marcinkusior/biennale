class AddOrderToPartnerCategories < ActiveRecord::Migration
  def change
    add_column :partner_categories, :order, :integer, default: 0
  end
end
