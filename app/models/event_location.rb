class EventLocation < ActiveRecord::Base
  attr_accessible :city, :country, :lat, :long, :long_name, :short_name, :street, :zipcode
  has_many :events

  def google_maps_query
      if lat == 0 && long == 0
          return "#{street} #{zipcode} #{city}"
      else
          return "#{lat},#{long}"
      end
  end

  def location_tooltip
    return "#{long_name}, #{street}, #{city}"
  end
end
