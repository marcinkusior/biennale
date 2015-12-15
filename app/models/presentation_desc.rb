class PresentationDesc < ActiveRecord::Base
  belongs_to :registration_conferences

  mount_uploader :src, AttachmentUploader
end
