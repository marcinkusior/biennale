# encoding: utf-8

class RegistrationUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "#{Rails.root}/storage/registration_conference_attachment/#{model.first_name}_#{model.last_name}"

  end
end
