class AddFaviconToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :favicon, :string
  end
end
