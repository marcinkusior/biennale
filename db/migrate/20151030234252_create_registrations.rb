class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :first_Name
      t.string :last_Name
      t.string :telephone
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :University
      t.string :supervisor_proffesor
      t.string :email
      t.boolean :terms_of_servie

      t.timestamps null: false
    end
  end
end
