class PlanController < ApplicationController
  def index
    if params[:orchestra] == 'sinf'
      @events = Event.where("begin>=:begin AND orchestra=:orchestra",
      {:begin=>Date.today-1, :orchestra=>"Sinfonieorchester"} )
    elsif params[:orchestra] == 'skp'
      @events = Event.where("begin>=:begin AND orchestra=:orchestra",
      {:begin=>Date.today-1, :orchestra=>"Stadtkapelle"} )
    else 
      @events = []
    end
    
    render :locals=>{:events => @events}
  end

end
