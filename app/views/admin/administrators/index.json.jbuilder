json.array!(@administrators) do |administrator|
  json.extract! administrator, :email, :password_digest
  json.url administrator_url(administrator, format: :json)
end