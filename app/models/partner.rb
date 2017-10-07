class Partner < ActiveRecord::Base
	attr_accessor :image

  belongs_to :partner_category
	mount_uploader :image, PartnerUploader

  def category_name
    partner_category.name
  end
end
