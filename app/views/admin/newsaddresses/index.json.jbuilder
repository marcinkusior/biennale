json.array!(@newsaddresses) do |newsaddress|
  json.extract! newsaddress, :email
  json.url newsaddress_url(newsaddress, format: :json)
end