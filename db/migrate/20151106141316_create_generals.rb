class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.boolean :registration_conference
      t.boolean :registration_contest
      t.boolean :voting_contest

      t.timestamps null: false
    end
  end
end
