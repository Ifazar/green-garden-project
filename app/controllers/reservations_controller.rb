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
    @reservation.status = 'En attente de validation'
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

  def validate
    @reservation = Reservation.find(params[:id])
    if @reservation.status == 'En attente de validation'
      @reservation.update(status: 'Réservation validée')
      redirect_to user_path(@reservation.user), notice: 'Réservation validée avec succès.'
    else
      redirect_to user_path(@reservation.user), alert: 'Cette réservation est déjà validée.'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end

end
