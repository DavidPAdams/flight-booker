class ReservationsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count]
  end

  def create
    
  end

  def show
  end
end
