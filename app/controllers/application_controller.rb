class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html, :json

    rescue_from Exception, :with => :generic_handler
  
  def generic_handler(exception)
    @general_log = GeneralLog.new
    @general_log.log_type = 1
    @general_log.header = "Erro PereiraEFranco"
    @general_log.body = exception.to_s
    @general_log.save
    
    raise exception
  end

end
