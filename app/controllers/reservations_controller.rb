class ReservationsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @travelers = params[:passenger_count].to_i
    @reservation = @flight.reservations.build
    @travelers.times { @reservation.passengers.build }
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
    @reservation = Reservation.find_by(id: params[:id])
    @travelers = Passenger.where(reservation_id: params[:id])
  end

  private

    def reservation_params
      params.require(:reservation).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end

end
