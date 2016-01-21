








class ContestRecord < ActiveRecord::Base
	belongs_to :contest_archive
	has_many :public_images, dependent: :destroy
	has_many :votes, dependent: :destroy

	default_scope {order('order_position ASC')}

	 accepts_nested_attributes_for :public_images, reject_if: :all_blank
end
