class EmailMessageController < ApplicationController
  
  def new
    @email_message = EmailMessage.new
  end

  def create
    @email_message = EmailMessage.new(params[:email_message])

    if @email_message.save
      flash[:notice] = 'Sua mensagem foi enviada.'
      redirect_to new_email_message_path
    else
      render :new
    end
  end

  
end
