class IngredientsController < InheritedResources::Base
	def new
		@beer = Beer.find(params[:beer_id])
		@ingredient = @beer.ingredients.build
	end

	def create
		@beer = Beer.find(params[:beer_id])
		@ingredient = @beer.ingredients.new(ingredient_params)
		if @ingredient.save
			redirect_to @beer, notice: 'ingredient added'
		else
			redirect_to @beer, notice: 'error'
		end
	end
  private

    def ingredient_params
      params.require(:ingredient).permit(:beer_id, :qty, :measurement, :name)
    end
end

