json.array!(@markers) do |marker|
  json.extract! marker, :lat, :lng, :desc
  json.url marker_url(marker, format: :json)
end