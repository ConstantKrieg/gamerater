json.extract! game, :id, :name, :genre_id, :publisher_id, :created_at, :updated_at
json.url game_url(game, format: :json)
