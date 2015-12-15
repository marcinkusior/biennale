class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :timedate
      t.text :description
      t.integer :order

      t.timestamps null: false
    end
  end
end
