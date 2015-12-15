class AddVotingOnToGenerals < ActiveRecord::Migration
  def change
    add_column :generals, :voting_on, :boolean
  end
end
