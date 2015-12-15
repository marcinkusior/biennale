json.array!(@registration_conferences) do |registration_conference|
  json.extract! registration_conference, :first_name, :last_name, :telephone, :group_name, :street, :city, :zip_code, :country, :university, :supervising_professor, :email, :terms_of_service, :serial
  json.url registration_conference_url(registration_conference, format: :json)
end