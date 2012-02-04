class HomeController < ApplicationController
  def index
    today = Date.today
    @start_date = Date.today  # Date.new(today.year, today.month, 1)
    @end_date = Date.today + 30  # Date.new(today.year, today.month + 1, 1) -1
    @monthly_events = Event.where(:start_at=> @start_date..@end_date).order("start_at")

    @latest_info = Info.order("created_at DESC").first

    @next_sinf_concert = Concert.where("start_at>=:start_at AND orchestra=:orchestra",
                          {:start_at=>Date.today, :orchestra=>"Sinfonieorchester"}).order("start_at").first
    @next_skp_concert = Concert.where("start_at>=:start_at AND orchestra=:orchestra",
                          {:start_at=>Date.today, :orchestra=>"Stadtkapelle"}).order("start_at").first

    respond_to do |format|
      format.html
    end
  end

end
