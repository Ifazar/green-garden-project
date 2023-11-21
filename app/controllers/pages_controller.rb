class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  

  def index
    @pages = Garden.all
  end

  def new
    @page = Garden.new
  end

  def create
    @page = Garden.new(garden_params)
    if @page.save
    redirect_to garden_path(@page)
    else
      render :new, status: :unprocessable_entity
    end
  end
  private


    def garden_params
        params.require(:garden).permit(:name, :address, :detail, :tool, :picture, :price)
    end
end
