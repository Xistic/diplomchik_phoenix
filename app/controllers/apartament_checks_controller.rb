class ApartmentChecksController < ApplicationController
  def new
    @apartment = Apartment.find(params[:apartment_id])
    @apartment_check = ApartmentCheck.new
  end
  
  def create
    @apartment = Apartment.find(params[:apartment_id])
    @apartment_check = @apartment.build_apartment_check(apartment_check_params)
    if @apartment_check.save
    redirect_to apartments_path, notice: 'Apartment has been checked.'
    else
    render :new
    end
  end
  
  private
  
  def apartment_check_params
    params.require(:apartment_check).permit(:checked_by, :status, :notes)
  end
end
  