class RemoveRatingFromBeerComments < ActiveRecord::Migration
  def change
  	remove_column :beer_comments, :like
  end
end
