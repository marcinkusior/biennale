class General < ActiveRecord::Base
	has_one :marker

  mount_uploader :primary_banner, ImageUploader
  mount_uploader :secondary_banner, ImageUploader
end
