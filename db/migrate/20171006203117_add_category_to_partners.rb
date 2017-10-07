class AddCategoryToPartners < ActiveRecord::Migration
  def change
    add_reference :partners, :partner_category, index: true, foreign_key: true
    add_column :partners, :url, :string
    remove_column :partners, :kind
  end
end
