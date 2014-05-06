class SkiAreasController < ApplicationController
  def new
    @ski_area = SkiArea.new
  end

  def create
    @ski_area = SkiArea.create(ski_area_strong_params)

    if @ski_area.errors.messages.empty?
      redirect_to ski_areas_path
    else
      render :new
    end
  end

  def edit
    @ski_area = SkiArea.find(params[:id])
  end

  def index
    @ski_areas = SkiArea.all
  end

  def show
    @ski_area = SkiArea.find(params[:id])
  end

  def update
    @ski_area = SkiArea.find(params[:id])
    @ski_area.update_attributes(ski_area_strong_params)
    redirect_to ski_area_path(@ski_area)
  end

  private

  def ski_area_strong_params
    params.require(:ski_area).permit(
      :ski_area_name,
      :country,
      :state,
      :pct_black,
      :pct_blue,
      :pct_green,
      :visited,
      :logo_url,
      :skiable_acres
    )
  end
end
