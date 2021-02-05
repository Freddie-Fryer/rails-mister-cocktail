class IngredientsController < ApplicationController
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save!
      redirect_back fallback_location: cocktails_path
    else
      redirect_back fallback_location: cocktails_path
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @cocktails = Cocktails.all
    @sorted_cocktails = @cocktails.sort_by { |obj| obj.name.downcase }

    query = <<-SQL
      SELECT cocktails.name
      FROM cocktails 
      JOIN albums ON tracks.album_id = albums.id
      JOIN artists ON albums.artist_id = artists.id
      JOIN genres ON tracks.genre_id = genres.id
      WHERE genres.name = "#{genre_name}"
      GROUP BY artists.name
      ORDER BY c  DESC
      LIMIT 5
    SQL
    @cocktails_by_ingredient = db.execute(query)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
