class AddBeerToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :beer, index: true
    add_foreign_key :ratings, :beers
  end
end
