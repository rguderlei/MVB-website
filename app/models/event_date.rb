class EventDate < ActiveRecord::Base
  attr_accessible :start_at, :event_location_id, :end_at
  # attr_accessible :title, :body
  belongs_to :event
  belongs_to :event_location

  validates :start_at, :end_at, :event_location, :presence => true
end
