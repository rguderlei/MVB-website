class Event < ActiveRecord::Base
  has_event_calendar  :start_at_field  => 'begin', :end_at_field => 'end'
end
