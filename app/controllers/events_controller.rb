class EventsController < ApplicationController
  
  def cover_image
    @event = Event.find(params[:id])
    @image = @event.cover_binary_data
    send_data(@image, :type     => @event.cover_content_type, 
                       :filename => @event.cover_file_name, 
                       :disposition => 'inline')
  end
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    respond_with @events
    
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    respond_with(@event)
  
    #render event_path(@event)
  end
  
end
