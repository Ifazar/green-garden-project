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
    if verif && @reservation.save
      redirect_to garden_reservation_path(@garden, @reservation)
    else
      redirect_to garden_path(@garden), notice: 'Réservation impossible sur ces dates.'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @garden = Garden.new
  end

  def confirme
    @reservation = Reservation.find(params[:garden_id])
    @reservation.update(status: 'Réservation validée')
    check
    redirect_to user_path(@reservation.user), notice: 'Réservation validée avec succès.'

  end

  def refuse
    @reservation = Reservation.find(params[:garden_id])
    @reservation.update(status: 'Réservation refusée')
    redirect_to user_path(@reservation.user), notice: 'Réservation refusée avec succès.'
  end
  
  def destroy
    @reservation = Reservation.find(params[:garden_id])
    @reservation.destroy
    redirect_to user_path
  end


  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end

  def check
    @start_date = Date.parse(@reservation.date.split(' to ')[0])
    @end_date = Date.parse(@reservation.date.split(' to ')[1])
    @past_reservations = Reservation.where(garden: @reservation.garden, status: 'En attente de validation')
    @past_reservations.each do |resa|
      @start_resa =  Date.parse(resa.date.split(' to ')[0])
      @end_resa =  Date.parse(resa.date.split(' to ')[1])
      unless @end_date < @start_resa ||  @start_date > @end_resa
        resa.update(status: 'Réservation refusée')
      end
    end
  end

  def verif
    @start_date = Date.parse(@reservation.date.split(' to ')[0])
    @end_date = Date.parse(@reservation.date.split(' to ')[1])
    @past_reservations = Reservation.where(garden: @reservation.garden, status: 'Réservation validée')
    @past_reservations.each do |resa|
      @start_resa =  Date.parse(resa.date.split(' to ')[0])
      @end_resa =  Date.parse(resa.date.split(' to ')[1])
      unless @end_date < @start_resa || @start_date > @end_resa
        return false
      end
    end
  end

end
