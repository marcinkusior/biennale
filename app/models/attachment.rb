class Attachment < ActiveRecord::Base
  validates :name,presence: true, uniqueness: true, format: { without: /\s/ }
  validates :src, presence: true

  mount_uploader :src, AttachmentUploader
end
