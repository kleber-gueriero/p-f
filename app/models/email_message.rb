class EmailMessage < ActiveRecord::Base
  attr_accessible :body, :from, :name, :subject
  
  validates_format_of :from, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :name, :from, :body

  after_create :send_email

protected

  def send_email
    ContactMailer.contact_message(self).deliver
  end

  
end
