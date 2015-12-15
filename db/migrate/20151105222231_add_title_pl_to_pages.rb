class AddTitlePlToPages < ActiveRecord::Migration
  def change
    add_column :pages, :titlePL, :string
  end
end
