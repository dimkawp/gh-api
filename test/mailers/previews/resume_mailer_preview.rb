# Preview all emails at http://localhost:3000/rails/mailers/resume_mailer
class ResumeMailerPreview < ActionMailer::Preview
  def new_mail
    mail = 'dimon8919@mail.ru'
    ResumeMailer.new_mail(mail)
  end
end
