








class ConferenceBackupMailJob
  include SuckerPunch::Job

  # The perform method is in charge of our code execution when enqueued.
  def perform(registration)
    RegisterMail.conference_backup_mail(registration).deliver
  end
end