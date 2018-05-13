json.extract! room, :id, :created_at, :updated_at, :name
json.url room_url(room, format: :json)
