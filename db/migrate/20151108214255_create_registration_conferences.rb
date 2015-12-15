class CreateRegistrationConferences < ActiveRecord::Migration
  def change
    create_table :registration_conferences do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :group_name
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :university
      t.string :supervising_professor
      t.string :email
      t.boolean :terms_of_service

      t.timestamps null: false
    end
  end
end
