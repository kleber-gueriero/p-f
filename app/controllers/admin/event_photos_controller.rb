class Admin::EventPhotosController < Admin::AdminController
  
  def image 
    @image_data = EventPhoto.find(params[:id])
    @image = @image_data.binary_data
    send_data(@image, :type     => @image_data.content_type, 
                       :filename => @image_data.file_name, 
                       :disposition => 'inline')
  end
  
  def index
    @event_photos = EventPhoto.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @event_photo = EventPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @event_photo = EventPhoto.new
    respond_with(@event_photo)
  end

  def edit
    @event_photo = EventPhoto.find(params[:id])
  end

  def create
    @event_photo = EventPhoto.new(params[:event_photo])

      if @event_photo.save
        flash[:notice] = "Foto adicionada com sucesso"
        respond_with([:admin,@event_photo])
      else
        format.html { render action: "new" }
      end
  end

  def update
    @event_photo = EventPhoto.find(params[:id])

    respond_to do |format|
      if @event_photo.update_attributes(params[:event_photo])
        format.html { redirect_to @event_photo, notice: 'Event photo was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @event_photo = EventPhoto.find(params[:id])
    @event_photo.destroy

    respond_to do |format|
      format.html { redirect_to event_photos_url }
    end
  end
end
