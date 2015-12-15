class AddBlockSiteToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :block_site, :boolean
  end
end
