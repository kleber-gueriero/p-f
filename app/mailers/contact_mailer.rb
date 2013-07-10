class ContactMailer < ActionMailer::Base
  default to: "kleberng1990@gmail.com", from: "contato@pereiraefranco.com.br"
  
  def contact_message(email_message)
    #@url  = "http://example.com/login"
    @email_message = email_message
    #mail options: :subject, :to, :from, :cc, :bcc, :reply_to, :date
    mail(:subject => @email_message.subject)
  end
  
end
