class Admin::SkiAreasController < ApplicationController
  before_action :require_admin

  def new
    @ski_area = SkiArea.new
  end

  def create
    @ski_area = SkiArea.create(ski_area_strong_params)

    if @ski_area.errors.messages.empty?
      redirect_to admin_ski_areas_path
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
    redirect_to admin_ski_area_path(@ski_area)
  end

  def destroy
    @ski_area = SkiArea.find(params[:id])
    @ski_area.destroy
    redirect_to admin_ski_areas_path
  end

  def upload
    records_saved = ImportCsv.new(params[:csv_file].read).process
    flash[:success] = "Congratulations, you've uploaded #{records_saved} ski area records"
    redirect_to admin_ski_areas_path
  end

  private

  def ski_area_strong_params
    params.require(:ski_area).permit(
      :ski_area_name,
      :country,
      :state,
      :logo_url,
      :skiable_acres
    )
  end
end
