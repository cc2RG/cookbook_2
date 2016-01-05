class QuantitiesController < ApplicationController

  def index
   @Quantities = Quantity.all
  end  

  def new
    @quantity = Quantity.new
  end  

  def create
    quantity = Quantity.create(quantities_params)
  end

  def edit
    @quantity = Quantity.find(params[:id])
  end  

  def update
    quantity = Quantity.find(params[:id])
    quantity.update(quantity_params)
  end

  def show
    @quantity = Quantity.find(params[:id])
  end

  def destroy
    quantity = Quantity.find(params[:id])
    quantity.destroy
  end  


  private

  def quantity_params
    params.require(:quantity).permit(:value, :ingredient_ids => [], :recipe_ids => [])
  end  
  
end  