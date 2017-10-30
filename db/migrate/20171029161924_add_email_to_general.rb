class AddEmailToGeneral < ActiveRecord::Migration
  def change
    add_column :generals, :registration_contest_mail, :text
    add_column :generals, :registration_conference_mail, :text
    add_column :generals, :registration_contest_mail_PL, :text
    add_column :generals, :registration_conference_mail_PL, :text
  end
end
