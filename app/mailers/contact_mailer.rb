class ContactMailer < ActionMailer::Base
  default to: "kleberng1990@gmail.com", from: "kleberng1990@gmail.com"
  
  def contact_message(email_message)
    #@url  = "http://example.com/login"
    @email_message = email_message
    #mail options: :subject, :to, :from, :cc, :bcc, :reply_to, :date
    mail(:from => @email_message.from, :subject => @email_message.subject)
  end
  
end
