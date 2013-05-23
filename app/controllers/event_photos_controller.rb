class EventPhotosController < ApplicationController
  
  def image 
    @image_data = EventPhoto.find(params[:id])
    @image = @image_data.binary_data
    send_data(@image, :type     => @image_data.content_type, 
                       :filename => @image_data.file_name, 
                       :disposition => 'inline')
  end
  
  # GET /event_photos
  # GET /event_photos.json
  def index
    @event_photos = EventPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_photos }
    end
  end

  # GET /event_photos/1
  # GET /event_photos/1.json
  def show
    @event_photo = EventPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_photo }
    end
  end

  # GET /event_photos/new
  # GET /event_photos/new.json
  def new
    @event_photo = EventPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_photo }
    end
  end

  # GET /event_photos/1/edit
  def edit
    @event_photo = EventPhoto.find(params[:id])
  end

  # POST /event_photos
  # POST /event_photos.json
  def create
    @event_photo = EventPhoto.new(params[:event_photo])

    respond_to do |format|
      if @event_photo.save
        format.html { redirect_to @event_photo, notice: 'Event photo was successfully created.' }
        format.json { render json: @event_photo, status: :created, location: @event_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @event_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_photos/1
  # PUT /event_photos/1.json
  def update
    @event_photo = EventPhoto.find(params[:id])

    respond_to do |format|
      if @event_photo.update_attributes(params[:event_photo])
        format.html { redirect_to @event_photo, notice: 'Event photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_photos/1
  # DELETE /event_photos/1.json
  def destroy
    @event_photo = EventPhoto.find(params[:id])
    @event_photo.destroy

    respond_to do |format|
      format.html { redirect_to event_photos_url }
      format.json { head :no_content }
    end
  end
end
