class Admin::EmailsController < ApplicationController
  before_filter :authorize

  def conference
    @general = General.first
  end

  def contest
    @general = General.first
  end

  def send_contest
    RegisterMailJob.new.perform(Registration.test_registration)
    redirect_to admin_root_path, notice: 'Testowy email został wysłany na adres inawbiennale@gmail.com'
  end

  def send_contest_pl
    I18n.locale = :pl
    RegisterMailJob.new.perform(Registration.test_registration("pl"))
    I18n.locale = :en
    redirect_to admin_root_path, notice: 'Testowy email został wysłany na adres inawbiennale@gmail.com'
  end

  def send_conference
    ConferenceRegisterMailJob.new.perform(RegistrationConference.test_registration)
    redirect_to admin_root_path, notice: 'Testowy email został wysłany na adres inawbiennale@gmail.com'
  end

  def send_conference_pl
    I18n.locale = :pl
    ConferenceRegisterMailJob.new.perform(RegistrationConference.test_registration)
    I18n.locale = :en
    redirect_to admin_root_path, notice: 'Testowy email został wysłany na adres inawbiennale@gmail.com'
  end
end
