json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :beer_id, :qty, :measurement, :name
  json.url ingredient_url(ingredient, format: :json)
end
