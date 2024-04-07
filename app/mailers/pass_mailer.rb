class PassMailer < ApplicationMailer
  def pass_status_changed(user, pass)
    @pass = pass
    mail(
      to: user.email,
      subject: "Изменение статуса пропуска",
    )
  end
end
