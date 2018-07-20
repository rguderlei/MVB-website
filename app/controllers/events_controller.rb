class EventsController < ApplicationController
  include Calendrier::EventExtension
  before_action :authenticate_user!, :except => [:index, :show]
  # GET /events
  # GET /events.xml
  def index
    @month = (params[:month] || Time.zone.now.month).to_i
    @year = (params[:year] || Time.zone.now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @first_day_of_week = 1

    first_day = @shown_month.beginning_of_month
    if first_day.wday != 1
      first_day -= 1.week
      first_day += 1.days until first_day.wday == 1
    end  

    last_day = @shown_month.end_of_month
    if last_day.wday != 0
      last_day += 1.days until last_day.wday == 0
    end  

    @visible_days = (first_day .. last_day)

    @events_by_date = EventDate.where(:start_at => (first_day .. (last_day + 1.day))).order(:start_at)
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @event.event_dates.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(event_params)


    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml { head :ok }
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :public_event, :description, :orchestra,
                                  :press_articles_attributes => [:id, :title, :publisher, :print_date, :article],
                                  :event_dates_attributes => [:id, :start_at, :event_location_id, :end_at, :additional_description])
  end
end
