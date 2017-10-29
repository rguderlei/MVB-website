class HomeController < ApplicationController
  def index
    @start_date = Date.today
    @next_concerts = Concert.distinct.joins(:event_dates).where("start_at > ?", @start_date).order("start_at")

    @latest_info = Info.order("created_at DESC").first

    @next_sinf_concert = Concert.where(orchestra: ["Sinfonieorchester", "Gesamtverein"]).joins(:event_dates).where("start_at>=?", Date.today).order("start_at").first
    @next_skp_concert = Concert.where(orchestra: ["Stadtkapelle", "Gesamtverein"]).joins(:event_dates).where("start_at>=?", Date.today).order("start_at").first

    respond_to do |format|
      format.html
    end
  end

end
