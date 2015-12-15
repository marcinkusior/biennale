json.array!(@paragraphs) do |paragraph|
  json.extract! paragraph, :body, :page_id
  json.url paragraph_url(paragraph, format: :json)
end