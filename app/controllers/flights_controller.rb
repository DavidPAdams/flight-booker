class FlightsController < ApplicationController
  def index
    
  end

  private

    def flight_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_time, :num_passengers)
    end
end
