class AddLocaleToRegistration < ActiveRecord::Migration
  def change
        add_column :registrations, :locale, :string
  end
end
