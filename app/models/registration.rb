class Registration < ActiveRecord::Base
	has_many :images, dependent: :delete_all
	accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:src].blank? }, :allow_destroy => true

	validates :serial, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email,presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :terms_of_service, presence: true
	validates :telephone, presence: true, format: { with: /[0-9()-+ ]+/, on: :create }
	validates :street, presence: true
	validates :city, presence: true
	validates :zip_code, presence: true
	validates :country, presence: true
	validates :university, presence: true
	validate :check_images_number



	private
	  def images_count_valid?
      images.size < 3
    end

    def check_images_number
        errors.add( :base, 'Please upload at least one file') if images.size < 1
    end
end
