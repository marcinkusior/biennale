json.array!(@records) do |record|
  json.extract! record, :body, :archive_id
  json.url record_url(record, format: :json)
end