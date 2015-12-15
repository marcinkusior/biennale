class Archive < ActiveRecord::Base
	has_many :records, dependent: :destroy
end
