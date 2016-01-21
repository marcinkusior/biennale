class AddOrderToPublicImages < ActiveRecord::Migration
  def change
    add_column :public_images, :order, :integer
  end
end
