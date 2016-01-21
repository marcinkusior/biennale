


class PublicImage < ActiveRecord::Base
  belongs_to :contest_record

  mount_uploader :src, PublicImageUploader



  default_scope {order('order_position ASC')}
  scope :first_in_order, -> {where(order_position: 0)[0]}
end
