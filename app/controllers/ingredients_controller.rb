class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save!
      redirect_back fallback_location: cocktails_path
    else
      redirect_back fallback_location: cocktails_path
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
