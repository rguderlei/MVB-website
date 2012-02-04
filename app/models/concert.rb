class Concert < Event
  has_attached_file :image, :styles => {:small=>"90x90#", :medium => "210x150#", :large => "320x230#", :xlarge => "800x800"}


  validates_presence_of :start_at, :end_at, :title, :orchestra
  has_event_calendar

  before_save :destroy_image?

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  private
    def destroy_image?
      self.image.clear if @image_delete == "1"
    end

end
