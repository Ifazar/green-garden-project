class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
    @gardens = Garden.where(user: current_user)
    @reservations = Reservation.where(garden_id: @gardens.pluck(:id))
    @resers = Reservation.where(user: current_user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'Utilisateur créé avec succès!'
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
