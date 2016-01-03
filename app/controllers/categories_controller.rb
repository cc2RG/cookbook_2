class CategoriesController < ApplicationController
@Recipes = Recipe.all

def index
  @categories = Category.all
end  

def new
  @category = Category.new
end

def create
  category = Category.create(category_params)
  redirect_to(categories_path)
end  

def edit
  @category = Category.find(params[:id])
end  

def update
   @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to @category
      else
        render 'edit'
      end    
end    

def show
  @category = Category.find(params[:id])
  @recipes = @category.recipes
end  

def destroy
  category = Category.find(params[:id])
  category.destroy
  redirect_to(categories_path)
end

private

def category_params
  params.require(:category).permit(:name)
end  




end  


