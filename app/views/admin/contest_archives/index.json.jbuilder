json.array!(@contest_archives) do |contest_archive|
  json.extract! contest_archive, :title, :titlePL
  json.url contest_archive_url(contest_archive, format: :json)
end