class Concert < Event
  has_attached_file :image, :styles => {:small => "150x150>", :medium => "800x800"}
end
