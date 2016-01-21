












class RenameColumnOrderAtPublicImages < ActiveRecord::Migration
  def change
  	rename_column :public_images, :order, :order_position
  end
end
