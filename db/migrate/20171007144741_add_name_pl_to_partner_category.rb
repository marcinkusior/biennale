class AddNamePlToPartnerCategory < ActiveRecord::Migration
  def change
    add_column :partner_categories, :namePl, :string
  end
end
