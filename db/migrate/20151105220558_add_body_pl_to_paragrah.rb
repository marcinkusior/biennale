class AddBodyPlToParagrah < ActiveRecord::Migration
  def change
    add_column :paragraphs, :bodyPL, :text
  end
end
