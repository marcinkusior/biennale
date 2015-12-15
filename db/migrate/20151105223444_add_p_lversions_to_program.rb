class AddPLversionsToProgram < ActiveRecord::Migration
  def change
  	add_column :events, :timedatePL, :text
  	add_column :events, :descPL, :text
  end
end
