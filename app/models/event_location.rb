class EventLocation < ActiveRecord::Base
  attr_accessible :city, :country, :lat, :long, :long_name, :short_name, :street, :zipcode
  has_many :events
end
