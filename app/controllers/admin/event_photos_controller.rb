#encoding: UTF-8

class Admin::EventPhotosController < Admin::AdminController
  
  def image 
    @image_data = EventPhoto.find(params[:id])
    @image = @image_data.binary_data
    send_data(@image, :type     => @image_data.content_type, 
                       :filename => @image_data.file_name, 
                       :disposition => 'inline')
  end
  
  def create
    @event = Event.find(params[:event_id])
    @event_photo = @event.event_photos.build(params[:event_photo])
    
    if @event_photo.save
      flash[:notice] = "Foto adicionada com sucesso"
    else
      flash[:notice] = "Foto não pode ser adicionada"
    end
    
    respond_with @event_photo do |format|
        format.html {redirect_to( edit_admin_event_path(@event))}
        #format.html {render( :partial => "admin/event_photos/form", :event => @event, :event_photo => @event_photo )}
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.find(params[:id])
    @event_photo.destroy

    redirect_to( edit_admin_event_path(@event))    

  end
end
