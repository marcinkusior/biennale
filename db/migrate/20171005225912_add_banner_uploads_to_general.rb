class AddBannerUploadsToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :primary_banner, :string
    add_column :generals, :secondary_banner, :string
  end
end
