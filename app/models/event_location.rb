class EventLocation < ApplicationRecord
  #attr_accessible :city, :country, :lat, :long, :long_name, :short_name, :street, :zipcode
  has_many :event_dates

  def google_maps_query
      if lat == 0 && long == 0
          return "#{street} #{zipcode} #{city}"
      else
          return "#{lat},#{long}"
      end
  end

  def location_tooltip
    location_name = long_name.blank? ? short_name : long_name
    return "#{location_name}, #{street}, #{city}"
  end
end
