json.array!(@archives) do |archive|
  json.extract! archive, :title
  json.url archive_url(archive, format: :json)
end