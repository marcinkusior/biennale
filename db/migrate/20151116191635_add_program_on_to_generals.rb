class AddProgramOnToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :program_on, :boolean
  end
end
