class TimeTicketsController < ApplicationController

  def index
    @time_tickets = TimeTicket.all
  end

  def new
    @time_ticket = TimeTicket.new(started_at: DateTime.now, ended_at: 2.days.from_now.to_datetime)
  end

  def create
    @time_ticket = TimeTicket.new(safe_params)
    @time_ticket.save
    redirect_to time_tickets_url
  end

  def edit
    @time_ticket = TimeTicket.find(params[:id])
  end

  def update
    @time_ticket = TimeTicket.find(params[:id])
    @time_ticket.update_attributes(safe_params)
    redirect_to time_tickets_url
  end

  private

  def safe_params
    safe_attributes = [
      :started_at,
      :ended_at,
    ]
    params.require(:time_ticket).permit(*safe_attributes)
  end
end
