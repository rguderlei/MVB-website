class Concert < Event
  has_event_calendar  :start_at_field  => 'begin', :end_at_field => 'end'
  has_attached_file :image, :styles => {:small => "150x150>", :medium => "800x800"}
end
