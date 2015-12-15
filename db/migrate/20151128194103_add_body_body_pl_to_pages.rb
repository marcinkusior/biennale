class AddBodyBodyPlToPages < ActiveRecord::Migration
  def change
    add_column :pages, :body, :text
    add_column :pages, :bodyPL, :text
  end
end
