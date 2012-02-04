class Event < ActiveRecord::Base
  has_event_calendar
  validates_presence_of :start_at, :end_at, :title, :orchestra


  def color
    return (orchestra=='Stadtkapelle')? 'blue': (orchestra=='Sinfonieorchester')? 'orange': 'green' ;
  end



  def to_ics (url)
    event = Icalendar::Event.new
    event.start = self.start_at.strftime("%Y%m%dT%H%M%S")
    event.end = self.end_at.strftime("%Y%m%dT%H%M%S")
    event.summary = self.title
    event.description = self.description
    event.location = self.location
    event.klass = "PUBLIC"
    event.created = self.created_at
    event.last_modified = self.updated_at
    event.uid = url
    event
  end
end
