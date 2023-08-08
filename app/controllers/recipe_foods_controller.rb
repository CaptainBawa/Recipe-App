class RecipeFoodsController < ApplicationController
  def new
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_parms)
    @recipe_food.recipe_id = params[:recipy_id]

    if @recipe_food.save
      redirect_to "/recipies/#{params[:recipy_id]}"
    else
      render :new, status: 422
    end
  end

  def destroy
    @recipe = RecipeFood.find_by(food_id: params[:id], recipe_id: params[:recipy_id])
    if @recipe.destroy
      redirect_to(request.referrer || root_path)
    else
      flash[:error] = 'error'
    end
  end

  private

  def recipe_food_parms
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
