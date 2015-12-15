class AddEditionNoToGenerals < ActiveRecord::Migration
  def change
  	add_column :generals, :edition_no, :integer
  end
end
