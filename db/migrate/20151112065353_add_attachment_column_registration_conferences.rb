class AddAttachmentColumnRegistrationConferences < ActiveRecord::Migration
  def change
  	add_column :registration_conferences, :attachment, :string
  end
end
