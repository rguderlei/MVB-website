class PlansController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @plans = Plan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @plans }
    end

  end

  # GET /probenplan/Sinfonieorchester
  # GET /plans/1
  def show
    if params[:orchestra]
      @plan = Plan.find_by_orchestra(params[:orchestra])
      raise ActiveRecord::RecordNotFound, "Seite nicht gefunden" if @plan.nil?
    else
      @plan = Plan.find(params[:id])
    end

    @events = Event.where("begin>=:begin AND (orchestra=:orchestra OR orchestra='Gesamtverein')",
                          {:begin=>Date.today-1, :orchestra=>@plan.orchestra}).order("begin")

    respond_to do |format|
      format.html
      format.ics do
        calendar = Icalendar::Calendar.new
        @events.each{ |event|
          calendar.add_event(event.to_ics( polymorphic_url(event)))
        }
        headers['Content-Type'] = "text/calendar; charset=UTF-8"
        calendar.publish
        render :text => calendar.to_ical
      end
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @plan = Plan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @plan }
    end
  end

  # GET /pages/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /pages
  # POST /pages.xml
  def create
    @plan = Plan.new(params[:plan])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to(@plan, :notice => 'plan was successfully created.') }
        format.xml { render :xml => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to(@plan, :notice => 'plan was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end


end
