class Vote < ActiveRecord::Base
  belongs_to :contest_record
end
