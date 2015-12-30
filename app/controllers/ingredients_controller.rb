class IngredientsController < ApplicationController

@Recipes = Recipe.all

def index
  @ingredients = Ingredient.all
end  

def new
  @ingredient = Ingredient.new
end

def create
  ingredient = Ingredient.create(ingredient_params)
  redirect_to(ingredients_path)
end  

def edit
  @ingredient = Ingredient.find(params[:id])
end  

def update
   ingredient = Ingredient.find(params[:id])
   ingredient.update(ingredient_params)
   redirect_to(ingredients_path)
end    

def show
  @ingredient = Ingredient.find(params[:id])
end  

def destroy
  ingredient = Ingredient.find(params[:id])
  ingredient.destroy
  redirect_to(ingredients_path)
end

private

def ingredient_params
  params.require(:ingredient).permit(:name, :recipe_ids => [])
end  


end


  



