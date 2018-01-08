class AddHeaderToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :pdf_header, :string
    add_column :generals, :pdf_body, :string
  end
end
