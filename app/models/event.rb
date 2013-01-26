class Event < ActiveRecord::Base
  attr_accessible :title, :public_event, :start_at, :end_at, :description, :location, :orchestra, :press_articles, :press_articles_attributes
  has_event_calendar
  validates_presence_of :start_at, :end_at, :title, :orchestra

  has_many :press_articles, :dependent => :destroy
  accepts_nested_attributes_for :press_articles

  def color
    return (orchestra=='Stadtkapelle')? 'blue': (orchestra=='Sinfonieorchester')? 'orange': 'green' ;
  end

  # TODO: render HTML as Markdown in ics
  def to_ics (url)
    event = Icalendar::Event.new
    event.start = self.start_at.strftime("%Y%m%dT%H%M%S")
    event.end = self.end_at.strftime("%Y%m%dT%H%M%S")
    event.summary = self.title
    p = HTMLPage.new :contents => self.description
    event.description = p.markdown
    event.location = self.location
    event.klass = "PUBLIC"
    event.created = self.created_at
    event.last_modified = self.updated_at
    event.uid = url
    event
  end
end
