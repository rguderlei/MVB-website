class EventsController < ApplicationController
  include Calendrier::EventExtension
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /events
  # GET /events.xml
  def index
    @month = (params[:month] || Time.zone.now.month).to_i
    @year = (params[:year] || Time.zone.now.year).to_i
    @shown_month = Date.civil(@year, @month)
    @first_day_of_week = 1
    event_strips = EventDate.where(:start_at => (@shown_month.beginning_of_month .. @shown_month.end_of_month))
    @events_by_date = sort_events(event_strips)
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
    @event = Event.new(params[:event])


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
      if @event.update_attributes(params[:event])
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
end
