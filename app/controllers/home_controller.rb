class HomeController < ApplicationController
  def index
    today = Date.today
    @start_date = Date.new(today.year, today.month, 1)
    @end_date = Date.new(today.year, today.month + 1, 1) -1
    @events = Event.where(:begin=> @start_date..@end_date)

    render :locals=>{:events=>@events, :start_date=>@start_date, :end_date=>@end_date}
  end

end
