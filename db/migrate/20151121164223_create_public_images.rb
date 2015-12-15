class CreatePublicImages < ActiveRecord::Migration
  def change
    create_table :public_images do |t|
      t.references :contest_record, index: true, foreign_key: true
      t.string :src

      t.timestamps null: false
    end
  end
end
