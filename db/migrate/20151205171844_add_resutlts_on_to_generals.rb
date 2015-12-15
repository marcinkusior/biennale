class AddResutltsOnToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :results_on, :boolean
  end
end
