class ReservationsController < ApplicationController
  def new
    @garden = Garden.find(params[:garden_id])
    @reservation = Reservation.new
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @user = User.find(params[:reservation][:user])
    @reservation = Reservation.new(user: @user, garden: @garden)
    if @reservation.save
      redirect_to reservation_path(@reservation.show)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @garden = Garden.new
  end

end
