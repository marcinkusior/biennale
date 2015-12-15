json.array!(@contest_records) do |contest_record|
  json.extract! contest_record, :title, :titlePL, :body, :bodyPL
  json.url contest_record_url(contest_record, format: :json)
end