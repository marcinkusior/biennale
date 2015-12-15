json.array!(@public_images) do |public_image|
  json.extract! public_image, :contest_record_id, :src
  json.url public_image_url(public_image, format: :json)
end