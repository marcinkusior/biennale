class ContestArchive < ActiveRecord::Base
	has_many :contest_records, dependent: :destroy
end
