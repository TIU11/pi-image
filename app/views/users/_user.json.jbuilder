json.extract! user, :id, :username, :created_at, :updated_at
json.url user_url(user, format: :json)

json.images(user.images) do |image|
  json.url rails_blob_url(image)
  json.content_type image.content_type
  json.name image.filename
end
