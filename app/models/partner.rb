class Partner < ActiveRecord::Base
	attr_accessor :image

	mount_uploader :image, PartnerUploader
end
