class Event < ActiveRecord::Base
  has_event_calendar  :start_at_field  => 'begin', :end_at_field => 'end'

  def color
    return (orchestra=='Stadtkapelle')? 'blue': 'green';
  end
end
