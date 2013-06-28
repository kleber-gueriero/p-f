class Admin::EventsController < Admin::AdminController

  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @event = Event.new
    respond_with @event
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    respond_with do |format|
      if @event.save
        format.html { redirect_to admin_events_url, notice: 'Event was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @event = Event.find(params[:id])

    respond_with do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to admin_events_url, notice: 'Event was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_with do |format|
      format.html { redirect_to admin_events_url }
    end
  end
end
