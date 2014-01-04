class Event < ActiveRecord::Base
  attr_accessible :title, :public_event, :event_location_id, :description, :orchestra, :press_articles, :press_articles_attributes, :event_dates, :event_dates_attributes
  has_event_calendar
  validates :start_at, :end_at, :title, :orchestra, :presence => true

  has_many :press_articles, :dependent => :destroy
  has_many :event_dates, :dependent => :destroy

  accepts_nested_attributes_for :press_articles

  belongs_to :event_location

  def color
    return (orchestra=='Stadtkapelle')? 'blue': (orchestra=='Sinfonieorchester')? 'orange': 'green' ;
  end

  def location_name
    if event_location.nil?
      if location.nil?
        return ""
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
        return ""
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
        return ""
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
