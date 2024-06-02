# app/controllers/apartments_controller.rb
class ApartmentsController < ApplicationController
  def new
    @building = Building.find(params[:building_id])
    @apartment = Apartment.new
  end

  def create
    @building = Building.find(params[:building_id])
    @apartment = @building.apartments.build(apartment_params)
    if @apartment.save
      redirect_to building_path(@building), notice: 'Квартира успешно создана.'
    else
      render :new
    end
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  private

  def apartment_params
    params.require(:apartment).permit(:number, :floor, :number_of_rooms, :area, :price)
  end
end
