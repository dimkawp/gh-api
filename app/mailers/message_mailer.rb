class MessageMailer < ApplicationMailer
  default from: 'mySelfWebSite@gmail.com'

  def new_message(name,mail,text)
    @name = name
    @mail = mail
    @text = text
    mail(to: 'dimkawp@gmail.com', subject: 'from my Self Web Site')
  end
end
