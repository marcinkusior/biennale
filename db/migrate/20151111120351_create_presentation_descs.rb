class CreatePresentationDescs < ActiveRecord::Migration
  def change
    create_table :presentation_descs do |t|
      t.string :src
      t.references :registration_conference, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
