json.array!(@beer_comments) do |beer_comment|
  json.extract! beer_comment, :id, :beer_id, :like, :user_id
  json.url beer_comment_url(beer_comment, format: :json)
end
