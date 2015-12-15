# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)

Page.create( title: "Biennial", slug: "Biennial", titlePL: "Biennale", order: 1 )
General.create(block_site: true, registration_conference: true, registration_contest: true, voting_contest: false, program_on: false )
Administrator.create( email: "kusior.marcin@gmail.com", password_digest: "$2a$10$ivpSR8kCBR9KUPIw7.JWWOFYpkNJOr9vpsJBmGZ.rmfnzfr41Hzb.")
# Vote.delete_all
# PublicImage.delete_all
# ContestRecord.delete_all
# Registration.destroy_all
# RegistrationConference.delete_all

# pictures = [
# 						# "/home/marcin/Desktop/Textures/07.png",
# 						# "/home/marcin/Desktop/Textures/09.png",
# 						# "/home/marcin/Desktop/Textures/01.png",
# 						# "/home/marcin/Desktop/Textures/02.png",
# 						# "/home/marcin/Desktop/Textures/03.png",
# 						# "/home/marcin/Desktop/Textures/04.png",
# 						# "/home/marcin/Desktop/Textures/10.png",
# 						# "/home/marcin/Desktop/Textures/11.png",
# 						# "/home/marcin/Desktop/Textures/12.png",
# 						"http://apod.nasa.gov/apod/image/1407/m31_bers_960.jpg",
# 						"http://www.oa.uj.edu.pl/apod/apod/image/1407/LondonNLC3Malin.jpg",
# 						"http://apod.nasa.gov/apod/image/1409/saturnequinox_cassini_960.jpg",
# 						"http://all4desktop.com/data_images/original/4204970-london-at-night.jpg",
# 						"http://elizabethgann.com/wp-content/uploads/2015/10/bedroom-design-ideas-for-modern-bedroom-design-ideas-wooden-modern-bedroom-cabinet.jpg",
# 						"http://catesthill.com/wp-content/uploads/2013/01/scan.jpg"
# 					 ]

# 10.times do |i|
# 	# record = ContestRecord.create( title: "seed_record#{i}", titlePL: "seed_record#{i}", body: "<p>body<p/>", serial: "seed#{i}", bodyPL: "<p>tresc</p>", contest_archive_id: 1 )
# 	# PublicImage.create(src: File.new( pictures.sample ), contest_record_id: record.id )
# 	Registration.new( first_name:'Marcin', last_name:'Kusior', email: (0...8).map { (65 + rand(26)).chr }.join + "@gmail.com", telephone: '123123123', street: "stret", city: 'aaa', zip_code: 'ads', country: 'country', terms_of_service: true, serial: 'seed' ).save(validate: false)
# 	Image.create( remote_src_url: pictures.sample, registration_id: Registration.last.id )
# 	Image.create( remote_src_url: pictures.sample, registration_id: Registration.last.id )
# 	Image.create( remote_src_url: pictures.sample, registration_id: Registration.last.id )
# end	