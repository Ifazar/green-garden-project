class ReservationsController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @reservation = Reservation.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @user = current_user

    @reservation = Reservation.new(user: @user, garden: @garden)
    if @reservation.save && @user != @garden.user
      redirect_to garden_reservation_path(@garden, @reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @garden = Garden.new
  end

end
