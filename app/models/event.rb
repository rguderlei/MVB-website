class Event < ActiveRecord::Base
  has_event_calendar  :start_at_field  => 'begin', :end_at_field => 'end'
  validates_presence_of :begin, :end, :title, :orchestra
  def color
    return (orchestra=='Stadtkapelle')? 'blue': (orchestra=='Sinfonieorchester')? 'green': 'yellow' ;
  end
end
