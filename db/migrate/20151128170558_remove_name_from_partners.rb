class RemoveNameFromPartners < ActiveRecord::Migration
  def change
    remove_column :partners, :name
  end
end
