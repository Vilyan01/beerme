class BeerCommentsController < InheritedResources::Base
	def new
		@beer = Beer.find(params[:beer_id])
		@beer_comment = @beer.beer_comments.build
	end

	def create
		@beer = Beer.find(params[:beer_id])
		@beer_comment = @beer.beer_comments.new(beer_comment_params)
		@beer_comment.user_id = current_user.id
		if @beer_comment.save
			redirect_to @beer, :notice => 'Comment added!'
		else
			render :new
		end
	end
  private

    def beer_comment_params
      params.require(:beer_comment).permit(:beer_id, :body, :user_id)
    end
end

