json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :description, :og, :fg, :abv, :color, :instructions, :added_by
  json.url beer_url(beer, format: :json)
end
