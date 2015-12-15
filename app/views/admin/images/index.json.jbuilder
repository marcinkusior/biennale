json.array!(@images) do |image|
  json.extract! image, :src, :registration_id
  json.url image_url(image, format: :json)
end