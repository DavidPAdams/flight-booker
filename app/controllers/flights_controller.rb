class FlightsController < ApplicationController

  def index
    @airport_choices = Airport.all.order(code: :asc).map{ |a| ["#{a.code} - #{a.name}", a.id] }
    @passenger_choices = (1..4).map{ |p| ["#{p} " + 'person'.pluralize(p), p] }

    if !params.nil?
      @passenger_count = params[:passenger_count]
      @flight_choices = Flight.where(departure_airport_id: params[:departure_airport_id])
                              .where(arrival_airport_id: params[:arrival_airport_id])
      render :index
    else
      render :index
    end
  end

  private

    def flight_params
      params.require(:flight).permit(:departure_airport_id, 
                                     :arrival_airport_id, 
                                     :departure_time, 
                                     :passenger_count)
    end

end
