json.extract! attachment, :id, :src, :name, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
