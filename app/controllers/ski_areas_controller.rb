class SkiAreasController < ApplicationController
  def new
    @ski_area = SkiArea.new
  end

  def create
    SkiArea.create(ski_area_name: params[:ski_area][:ski_area_name])

    redirect_to ski_areas_path
  end

  def index
    @ski_areas = SkiArea.all
  end
end