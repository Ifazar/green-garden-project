class ReservationsController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @reservation = Reservation.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @reservation = Reservation.new(date: params[:reservation][:date])
    @reservation.user = current_user if current_user != @garden.user
    @reservation.garden = @garden
    if @reservation.save
      redirect_to garden_reservation_path(@garden, @reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @garden = Garden.new
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end

end
