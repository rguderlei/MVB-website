class Concert < Event
  attr_accessible :title, :public_event, :event_location_id, :image, :image_delete, :start_at, :end_at, :description, :location, :orchestra, :press_articles, :press_articles_attributes

  has_attached_file :image,  :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename", :styles => {:small=>"90x90#", :medium => "210x150#", :large => "320x230#", :xlarge => "800x800"}


  validates :start_at, :end_at, :title, :orchestra, :presence => true
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
