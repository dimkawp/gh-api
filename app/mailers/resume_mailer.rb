class ResumeMailer < ApplicationMailer
  default from: "dimkawp@gmail.com"

  def new_mail(mail)
    mail(to: mail, subject: 'RESUME')
  end
end
