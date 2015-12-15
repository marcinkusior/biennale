class CreateContestRecords < ActiveRecord::Migration
  def change
    create_table :contest_records do |t|
      t.string :title
      t.string :titlePL
      t.text :body
      t.text :bodyPL

      t.timestamps null: false
    end
  end
end
