class ConcertsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET //concerts
  # GET /concerts.xml
  def index
    @concerts = Concert.joins(:event_dates).order('start_at DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @concerts }
    end
  end

  # GET /concerts/1
  # GET /concerts/1.xml
  def show
    @concert = Concert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @concert }
    end
  end

  # GET /concerts/new
  # GET /concerts/new.xml
  def new
    @concert = Concert.new
    @concert.event_dates.build

    @concert.public_event = true
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @concert }
    end
  end

  # GET /concerts/1/edit
  def edit
    @concert = Concert.find(params[:id])
  end

  # POST /concerts
  # POST /concerts.xml
  def create
    @concert = Concert.new(concert_params)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to(@concert, :notice => 'Concert was successfully created.') }
        format.xml { render :xml => @concert, :status => :created, :location => @concert }
      else
        format.html { render :action => 'new' }
        format.xml { render :xml => @concert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /concerts/1
  # PUT /concerts/1.xml
  def update
    @concert = Concert.find(params[:id])

    respond_to do |format|
      if @concert.update_attributes(concert_params)
        format.html { redirect_to(@concert, :notice => 'Concert was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @concert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.xml
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy

    respond_to do |format|
      format.html { redirect_to(concerts_url) }
      format.xml { head :ok }
    end
  end

  private
  def concert_params
    params.require(:concert).permit(:title, :public_event, :image, :image_delete, :description, :orchestra,
                                    :press_articles_attributes=> [:id, :title, :publisher, :print_date, :article],
                                    :event_dates_attributes => [:id, :start_at, :event_location_id, :end_at, :additional_description])
  end
end
