class RegisterConferenceMailJob
  include SuckerPunch::Job

  # The perform method is in charge of our code execution when enqueued.
  def perform(registration)
    RegisterMail.register_conference_success_mail(registration).deliver
  end
end
