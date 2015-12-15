class CreateContestArchives < ActiveRecord::Migration
  def change
    create_table :contest_archives do |t|
      t.string :title
      t.string :titlePL

      t.timestamps null: false
    end
  end
end
