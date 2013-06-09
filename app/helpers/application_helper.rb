module ApplicationHelper
  # used to print individual titles on each page
  # see  https://gist.github.com/stammy/941997
  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output = "MVB - " + output if !output.blank?
    output
  end

  def link_to_location(location)
    location_long = {"BFM"=>"Bruno-Frey-Musikschule Wielandstr. 27 88400 Biberach",
                    "Marktplatz" => "Marktplatz Biberach",
                    "St. Martin" => "Kirchplatz 1 Biberach",
                    "St.-Martins-Kirche" => "Kirchplatz 1 Biberach",
                    "St. Martin Biberach" => "Kirchplatz 1 Biberach",
                    "Museumshof" => "Braith-Mali-Museum Biberach",
                    "Stadtgarten" =>"48.096869,9.785511",
                    "PG-Innenhof" => "Pestalozzi-Gymnasium Biberach"
                    }
    location_long.default = location

    href = "http://maps.google.de/maps?q=#{location_long[location]}"
    output = "<a class=\"event-location\" target=\"_blank\" title=\"\" data-placement=\"right\" data-toggle=\"tooltip\" href=\"#{href}\" data-original-title=\"#{location_long[location]}\">#{location}</a>"

    output.html_safe
  end
end
