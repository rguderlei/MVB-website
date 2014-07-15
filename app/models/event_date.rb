class EventDate < ActiveRecord::Base
  #attr_accessible :start_at, :event_location_id, :end_at, :event_id, :location, :additional_description

  belongs_to :event
  belongs_to :event_location

  validates :start_at, :end_at, :event_location, :presence => true
  validates :start_at, :date => true
  validates :end_at, :date => { :after=>:start_at }

   def context_class
     return (event.orchestra=='Stadtkapelle')? 'skp': (event.orchestra=='Sinfonieorchester')? 'sinf': 'mvb' ;
   end

   def begin_time
     start_at
   end

   def end_time
     end_at
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
    event.dtstart = self.start_at.strftime('%Y%m%dT%H%M%S')
    event.dtend = self.end_at.strftime('%Y%m%dT%H%M%S')
    event.summary = self.event.title
    p = HTMLPage.new :contents => self.event.description
    event.description = p.markdown
    event.location = self.location_name
    event.ip_class = 'PUBLIC'
    event.created = self.created_at.strftime('%Y%m%dT%H%M%S')
    event.last_modified = self.updated_at.strftime('%Y%m%dT%H%M%S')
    event.uid = url
    event
  end

end
