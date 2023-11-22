class GardensController < ApplicationController
  before_action :set_garden, only: %i[show edit update destroy]

  def new
    @garden = Garden.new
  end

  def show

  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @garden.save
  end

  def update
    @garden.update(garden_params)
    @garden.save
    redirect_to pages_path
  end

  def destroy
    @garden.destroy
    redirect_to pages_path
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :address, :detail, :tool, :image, :price)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
