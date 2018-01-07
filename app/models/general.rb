class General < ActiveRecord::Base
	has_one :marker

  mount_uploader :primary_banner, ImageUploader
  mount_uploader :secondary_banner, ImageUploader
  mount_uploader :favicon, ImageUploader
  mount_uploader :contest_mail_attachment, GeneralAttachmentUploader
  mount_uploader :contest_mail_attachment_PL, GeneralAttachmentUploader
  mount_uploader :conference_mail_attachment, GeneralAttachmentUploader
  mount_uploader :conference_mail_attachment_PL, GeneralAttachmentUploader

end
