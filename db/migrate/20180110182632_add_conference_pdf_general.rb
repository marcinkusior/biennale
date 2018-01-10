class AddConferencePdfGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :pdf_conference_body, :string
  end
end
