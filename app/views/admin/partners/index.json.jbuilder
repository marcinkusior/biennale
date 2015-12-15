json.array!(@partners) do |partner|
  json.extract! partner, :name, :image
  json.url partner_url(partner, format: :json)
end