json.extract! post, :id, :content, :created_at, :updated_at
json.image_url rails_blob_url(post.image) if post.image.attached?
json.url post_url(post, format: :json)
