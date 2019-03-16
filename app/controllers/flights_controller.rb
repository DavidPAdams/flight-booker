class FlightsController < ApplicationController

  def index
    @airport_choices = Airport.all.order(code: :asc).map{ |a| ["#{a.code} - #{a.name}", a.id] }
    @passenger_choices = (1..4).map{ |p| ["#{p} " + 'person'.pluralize(p), p] }
    @departure_airport = params[:departure_airport_id]
    @arrival_airport = params[:arrival_airport_id]
    @passenger_count = params[:passenger_count].to_i
    @depart_date = params[:depature_time]
    @flights = Flight.available_flights(params[:departure_airport_id], params[:arrival_airport_id]).order(departure_time: :asc)
    @flight_dates = Flight.date_list(params[:departure_airport_id], params[:arrival_airport_id])

    if params[:commit] == "Search Flights"
      if params[:departure_airport_id] == params[:arrival_airport_id]
        flash[:danger] = "Your Departure and Arrival Airports Can Not Be the Same"  
      end
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
