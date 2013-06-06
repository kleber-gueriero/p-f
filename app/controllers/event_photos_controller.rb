class EventPhotosController < ApplicationController
  
  def before_image 
    @event_photo = EventPhoto.find(params[:id])
    @image = @event_photo.before_binary_data
    send_data(@image, :type     => @event_photo.before_content_type, 
                       :filename => @event_photo.before_file_name, 
                       :disposition => 'inline')
  end

  def after_image 
    @event_photo = EventPhoto.find(params[:id])
    @image = @event_photo.after_binary_data
    send_data(@image, :type     => @event_photo.after_content_type, 
                       :filename => @event_photo.after_file_name, 
                       :disposition => 'inline')
  end
  
end
