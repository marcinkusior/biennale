class AddMapControlToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :marker_id, :integer
    add_column :generals, :map_zoom, :integer
  end
end
