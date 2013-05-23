class Admin::AdminController < ApplicationController
  before_filter :authenticate_admin!
  
  def admin
    
  end
  
end
