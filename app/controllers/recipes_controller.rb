class RecipesController < ApplicationController
@Categories = Category.all
@Ingredients = Ingredient.all

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @category = Category.all
    @ingredients = Ingredient.all
  end

  def create
    recipe = Recipe.create(recipe_params)
    category = Category.find(params["recipe"] ["category_id"].to_i)
    category.recipes << recipe
    redirect_to(recipes_path)
  end  


  def edit
    @recipe = Recipe.find(params[:id])
    @category = Category.all
    @ingredients = Ingredient.all
  end

  def update
    @recipe = Recipe.find(params[:id])
      if @recipe.update(recipe_params)
        redirect_to @recipe
      else
        render 'edit'
      end    
  end  

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to(recipes_path)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :description, :instruction, :ingredient_ids => [])
  end  

  

end