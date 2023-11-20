class GardensController < ApplicationController
  before_action :set_garden, only: %i[show]

  def new
    @garden = Garden.new
  end

  def show

  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def garden_params
    params.require(:garden).permit(:name, :address, :detail, :tool, :picture, :price)
  end

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end
end
