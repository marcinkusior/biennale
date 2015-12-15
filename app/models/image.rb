class Image < ActiveRecord::Base
  belongs_to :registration

  mount_uploader :src, ImageUploader
end
