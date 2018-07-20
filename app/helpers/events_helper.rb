module EventsHelper
  def print_events(current_day, events) 
  
    result = ""

    if !events.nil?  
      events.each do |event| 
        if event.start_at.day == current_day.day && event.start_at.month == current_day.month
            result += link_to(%Q(
              <div class="event #{event.event.orchestra.downcase}">
                <div class="event-desc">
                  #{event.event.title}
                </div>
                <div class="event-time">
                  #{l(event.start_at, :format=> :time)} - #{l(event.end_at, :format=> :time)}
                </div>
              </div>  
              ).html_safe, polymorphic_path(event.event))
        end
      end   
    end

    return result
  end
end
