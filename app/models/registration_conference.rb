class RegistrationConference < ActiveRecord::Base

	validates :first_name, :presence => {message: "We need to know who is filling in this form (your name)"}
	validates :last_name, presence: true
	validates :email,presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :terms_of_service, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :zip_code, presence: true
	validates :country, presence: true
	validates :university, presence: true
	validates :telephone, presence: true, format: { with: /[0-9()-+ ]+/, on: :create }
	# validates :attachment, presence: true

	mount_uploader :attachment, RegistrationUploader

  def self.test_registration
    return RegistrationConference.new({
		  "id"=>5,
		  "first_name"=>"test",
		  "last_name"=>"test",
		  "telephone"=>"123456789",
		  "street"=>"test",
		  "city"=>"test",
		  "zip_code"=>"30-000",
		  "country"=>"test",
		  "university"=>"test",
		  "email"=>"inawbiennale@gmail.com",
		  "terms_of_service"=>true,
		  "subject"=>"test"
    })
  end
end
