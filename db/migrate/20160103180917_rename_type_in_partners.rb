class RenameTypeInPartners < ActiveRecord::Migration
  def change
  	rename_column :partners, :type, :kind
  end
end
