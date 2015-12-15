class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
