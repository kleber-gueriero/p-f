class EventPhotosController < ApplicationController
  
  def image 
    @image_data = EventPhoto.find(params[:id])
    @image = @image_data.binary_data
    send_data(@image, :type     => @image_data.content_type, 
                       :filename => @image_data.file_name, 
                       :disposition => 'inline')
  end
end
