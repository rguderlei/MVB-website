class HomeController < ApplicationController
  def index
    today = Date.today
    @start_date = Date.today  # Date.new(today.year, today.month, 1)
    @end_date = Date.today + 30  # Date.new(today.year, today.month + 1, 1) -1
    @monthly_events = Event.where(:begin=> @start_date..@end_date).order("begin")

    @latest_info = Info.order("created_at DESC").first

    @next_sinf_concert = Concert.where("begin>=:begin AND orchestra=:orchestra",
                          {:begin=>Date.today, :orchestra=>"Sinfonieorchester"}).order("begin").first
    @next_skp_concert = Concert.where("begin>=:begin AND orchestra=:orchestra",
                          {:begin=>Date.today, :orchestra=>"Stadtkapelle"}).order("begin").first

    respond_to do |format|
      format.html
    end
  end

end
