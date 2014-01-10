module ApplicationHelper
  # used to print individual titles on each page
  # see  https://gist.github.com/stammy/941997
  def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output = "MVB - " + output if !output.blank?
    output
  end

  def link_to_location(event_date)

    if !event_date.event_location.nil?
      href = "http://maps.google.de/maps?q=#{event_date.google_maps_query}"
      output = "#{event_date.location_name} <a class=\"event-location noprint\" target=\"_blank\" title=\"\" data-placement=\"right\" data-toggle=\"tooltip\" href=\"#{href}\" data-original-title=\"#{event_date.location_tooltip}\"><i class=\"icon-globe\"></i></a>"

      output.html_safe
    else
      ''
    end
  end
end
