class Page < ActiveRecord::Base
	has_many :paragraphs, dependent: :destroy
end
