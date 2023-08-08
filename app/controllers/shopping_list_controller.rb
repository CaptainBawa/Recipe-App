class ShoppingListController < ApplicationController
  def index
    @recipes = current_user.recipies.includes(recipe_foods: :food)
    @all_recipe_foods = @recipes.map(&:recipe_foods).flatten

    @recipe_foods = @all_recipe_foods.select { |recipe| recipe.quantity > recipe.food.quantity }
  end
end
