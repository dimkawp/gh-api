class MessageWokMailer < ApplicationMailer
  default from: 'worldofkeg.com.ua/'

  def new_message(name,mail,price,text)
    @name = name
    @mail = mail
    @price = price
    @text = text
    mail(to: 'elefantenko@gmail.com', subject: 'from worldofkeg.com.ua')
  end
end
