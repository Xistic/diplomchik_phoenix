# app/controllers/buildings_controller.rb
class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to buildings_path, notice: 'Building was successfully created.'
    else
      render :new
    end
  end

  def show
    @building = Building.find(params[:id])
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    if @building.update(building_params)
      redirect_to buildings_path, notice: 'Building was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to buildings_path, notice: 'Building was successfully deleted.'
  end

  private

  def building_params
    params.require(:building).permit(:name, :year_built, :wall_material, :number_of_floors, :floor_type, :gas, :number_of_entrances, :number_of_apartments)
  end
end
