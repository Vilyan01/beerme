class Beer < ActiveRecord::Base
	has_many :beer_comments, :dependent => :destroy
	has_many :ingredients, :dependent => :destroy
	has_many :ratings, :dependent => :destroy
end
