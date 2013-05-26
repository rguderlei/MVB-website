class HomeController < ApplicationController
  def index
    @start_date = Date.today
    @next_concerts = Concert.where("start_at > ?", @start_date).order("start_at")

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
