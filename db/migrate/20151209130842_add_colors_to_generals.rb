class AddColorsToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :primary_color, :string
    add_column :generals, :secondary_color, :string
  end
end
