class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :ip_address
      t.references :contest_record, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
