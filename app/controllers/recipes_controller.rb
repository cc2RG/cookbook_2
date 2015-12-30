class RecipesController < ApplicationController
@Categories = Category.all


  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @category = Category.all
  end

  def create
    recipe = Recipe.create(recipe_params)
    category = Team.find(params["player"] ["category_id"].to_i)
    category.recipes << recipe
    redirect_to(recipes_path)
  end  


  def edit
    @recipe = Recipe.find(params[:id])
    @category = Category.all
  end

  def update
    recipe = Recipe.create(recipe_params)
    category = Team.find(params["player"] ["category_id"].to_i)
    category.recipes << recipe
    redirect_to(recipes_path)
  end  

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to( recipes_path )
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :description, :instruction)
  end  

  

end