class PublicImage < ActiveRecord::Base
  belongs_to :contest_record

  mount_uploader :src, PublicImageUploader
end
