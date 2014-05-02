class SkiAreasController < ApplicationController
  def new
    @ski_area = SkiArea.new
  end

  def create
    SkiArea.create(
      ski_area_name: params[:ski_area][:ski_area_name],
      country: params[:ski_area][:country],
      state: params[:ski_area][:state],
      pct_black: params[:ski_area][:pct_black],
      pct_blue: params[:ski_area][:pct_blue],
      pct_green: params[:ski_area][:pct_green],
      visited: params[:ski_area][:visited],
      logo_url: params[:ski_area][:logo_url],
      skiable_acres: params[:ski_area][:skiable_acres]
    )

    redirect_to ski_areas_path
  end

  def index
    @ski_areas = SkiArea.all
  end
end
