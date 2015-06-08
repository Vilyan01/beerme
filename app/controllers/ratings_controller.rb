class RatingsController < ApplicationController
	def new
		@beer = Beer.find(params[:beer_id])
		@rating = @beer.ratings.build
	end

	def create
		@beer = Beer.find(params[:beer_id])
		@like = true
		@user = current_user.id
		@rating = @beer.ratings.build
		@rating.like = @like
		@rating.user_id = @user
		if @rating.save
			redirect_to @beer, notice: 'Liked'
		else
			redirect_to @beer, notice: 'Nope.  Like didnt work'
		end
	end

	def dislike
		@beer = Beer.find(params[:beer_id])
		@like = false
		@user = current_user.id
		@rating = @beer.ratings.build
		@rating.like = @like
		@rating.user_id = @user
		if @rating.save
			redirect_to @beer, notice: 'Disliked'
		else
			redirect_to @beer, notice: 'Nope.  Dislike didnt work'
		end
	end

	private
	def ratings_params
		params.permit(:beer_id, :user_id, :like)
	end
end
