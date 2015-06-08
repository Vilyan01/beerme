class BeersController < InheritedResources::Base
	before_action :authenticate_user!
	def index
		@beers = Beer.all
	end

	def show
		@beer = Beer.find(params[:id])
		@comments = @beer.beer_comments
		@ratings = @beer.ratings.all
		@likesArray = Array.new
		@dislikesArray = Array.new
		@ratings.each do |rating|
			if rating.like
				@likesArray.push(rating)
			else
				@dislikesArray.push(rating)
			end
		end
		@likes = @likesArray.count
		@dislikes = @dislikesArray.count
	end

	def new
		@beer = Beer.new
	end

	def create
		@beer = Beer.new(beer_params)
		@beer.added_by = current_user.id
		respond_to do |format|
			if @beer.save
				format.html { redirect_to beers_path, notice: 'Created beer!'}
			else
				format.html { render :new }
			end
		end
	end

	def like
		@beer = Beer.find(params[:beer_id])
		@rating = @beer.ratings.build
		@rating.beer_id = @beer
		@rating.user_id = current_user.id
		@rating.like = true
		if @rating.save
			redirect_to @beer, notice: 'Thanks for the feedback!'
		else
			redirect_to @beer, error: 'uhh... yeaaah.... something bad happened'
		end
	end

	def dislike
		@beer = Beer.find(params[:beer_id])
		@rating = @beer.ratings.new
		@rating.beer_id = @beer
		@rating.user_id = current_user.id
		@rating.like = false
		if @rating.save
			redirect_to @beer, notice: 'Thanks for the feedback!'
		else
			redirect_to @beer, error: 'Apparently it doesnt want to be disliked.  Try again'
		end
	end
  private
    def beer_params
      params.require(:beer).permit(:name, :description, :og, :fg, :abv, :color, :instructions, :added_by)
    end
end

