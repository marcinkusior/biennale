json.array!(@events) do |event|
  json.extract! event, :timedate, :description, :order
  json.url event_url(event, format: :json)
end