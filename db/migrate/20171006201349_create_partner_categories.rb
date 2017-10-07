class CreatePartnerCategories < ActiveRecord::Migration
  def change
    create_table :partner_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
