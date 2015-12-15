class Add < ActiveRecord::Migration
  def change
  	add_column :generals, :partners_on, :boolean
  end
end
