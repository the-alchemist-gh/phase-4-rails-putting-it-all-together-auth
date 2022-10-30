class RecipesController < ApplicationController
    def index
        all_recipes = Recipe.all
        render json: all_recipes
    end

    def create
        user = User.find_by(id: session[:user_id])
        new_recipe = user.recipes.create!(recipe_param)
        render json: new_recipe, status: :created
    end

    private

    def recipe_param
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end
