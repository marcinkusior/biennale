class RegisterMailJob
  include SuckerPunch::Job

  def perform(registration)
    RegisterMail.register_success_mail(registration).deliver
  end
end
