json.array!(@registrations) do |registration|
  json.extract! registration, :first_Name, :last_Name, :telephone, :street, :city, :zip_code, :country, :University, :supervisor_proffesor, :email, :terms_of_servie
  json.url registration_url(registration, format: :json)
end