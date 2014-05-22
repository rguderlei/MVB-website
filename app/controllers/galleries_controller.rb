class GalleriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /galleries
  # GET /galleries.xml
  def index
    @galleries = Gallery.order('context_date DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    @gallery = Gallery.new
    @gallery.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to(@gallery, :notice => 'Gallery was successfully created.') }
        format.xml { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => 'new' }
        format.xml { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        format.html { redirect_to(@gallery, :notice => 'Gallery was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(galleries_url) }
      format.xml { head :ok }
    end
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name, :context_date, :photos_attributes => [:image, :id])
  end
end
