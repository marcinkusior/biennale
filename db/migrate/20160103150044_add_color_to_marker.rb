class AddColorToMarker < ActiveRecord::Migration
  def change
    add_column :markers, :color, :string
  end
end
