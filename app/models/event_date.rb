class EventDate < ActiveRecord::Base
  attr_accessible :start_at, :event_location_id, :end_at, :event_id, :location, :additional_description

  has_event_calendar

  belongs_to :event
  belongs_to :event_location

  validates :start_at, :end_at, :event_location, :presence => true
  validates :start_at, :date => true
  validates :end_at, :date => { :after=>:start_at }

   def color
     return (event.orchestra=='Stadtkapelle')? 'blue': (event.orchestra=='Sinfonieorchester')? 'orange': 'green' ;
   end

   def location_name
     if event_location.nil?
       if location.nil?
         return ''
       else
         return location
       end
     else
       return event_location.short_name
     end
   end

   def location_tooltip
     if event_location.nil?
       if location.nil?
         return ''
       else
         return location
       end
     else
       return event_location.location_tooltip
     end
   end

   def google_maps_query
     if event_location.nil?
       if location.nil?
         return ''
       else
         return location
       end
     else
       return event_location.google_maps_query
     end
   end


  def to_ics (url)
    event = Icalendar::Event.new
    event.start = self.start_at.strftime("%Y%m%dT%H%M%S")
    event.end = self.end_at.strftime("%Y%m%dT%H%M%S")
    event.summary = self.event.title
    p = HTMLPage.new :contents => self.event.description
    event.description = p.markdown
    event.location = self.location_name
    event.klass = "PUBLIC"
    event.created = self.created_at
    event.last_modified = self.updated_at
    event.uid = url
    event
  end

end
