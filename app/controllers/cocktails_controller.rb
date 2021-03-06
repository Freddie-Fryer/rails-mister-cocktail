class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @sorted_cocktails = @cocktails.sort_by { |obj| obj.name.downcase }
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  def home
    @cocktails = Cocktail.all
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
