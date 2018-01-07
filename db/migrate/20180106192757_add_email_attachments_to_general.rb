class AddEmailAttachmentsToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :contest_mail_attachment, :string
    add_column :generals, :contest_mail_attachment_PL, :string
    add_column :generals, :conference_mail_attachment, :string
    add_column :generals, :conference_mail_attachment_PL, :string
  end
end
