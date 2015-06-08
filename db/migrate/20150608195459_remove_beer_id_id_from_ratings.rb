class RemoveBeerIdIdFromRatings < ActiveRecord::Migration
  def change
  	remove_column :ratings, :beer_id_id
  end
end
