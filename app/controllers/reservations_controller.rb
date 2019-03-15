class ReservationsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passenger_count]
    @reservation = Reservation.new
    # @passenger_count.to_i.times{ @reservation.passenger.build }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      @flight = Flight.find(params[:flight_id])
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

    def reservation_params
      params.require(:reservation).permit(:flight_id, :passenger_id, passenger_attributes: [:id, :name, :email])
    end

end
