# app/controllers/apartments_controller.rb
class ApartmentsController < ApplicationController
  def index 
    @apartments = Apartment.all
  end

  def new
    @buildings = Building.all
    @apartment = Apartment.new
  end

  def create
    @building = Building.find(apartment_params[:building_id])
    @apartment = @building.apartments.build(apartment_params)
    if @apartment.save
      redirect_to building_path(@building), notice: 'Квартира успешно создана.'
    else
      render :new
    end
  end
  
  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy
    redirect_to building_path(params[:building_id]), notice: 'Квартира успешно удалена'
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def edit
    @apartment = Apartment.find(params[:id])
    @buildings = Building.all
  end

  def update
    @apartment = Apartment.find(params[:id])
    if @apartment.update(apartment_params)
      redirect_to apartments_path, notice: 'Квартира успешно обновлена.'
    else
      @buildings = Building.all
      render :edit
    end
  end

  private

  def apartment_params
    params.require(:apartment).permit(:number, :floor, :number_of_rooms, :area, :price, :building_id)
  end
end
