class CreateNewsaddresses < ActiveRecord::Migration
  def change
    create_table :newsaddresses do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
