class BackupMailJob
  include SuckerPunch::Job

  def perform(registration)
  	RegisterMail.backup_mail(registration).deliver
  end
end