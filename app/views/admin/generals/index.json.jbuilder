json.array!(@generals) do |general|
  json.extract! general, :registration_conference, :registration, :voting
  json.url general_url(general, format: :json)
end