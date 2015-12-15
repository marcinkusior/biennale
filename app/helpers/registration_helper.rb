module RegistrationHelper

	def create_serial
		serials = Registration.all.map{ |registration| registration.serial }
		serial = General.first.edition_no.to_s + (10 + rand * 90).to_i.to_s + (65 +rand(26)).chr + (65 +rand(26)).chr 

		while serials.include?(serial)
			serial = General.first.edition_no.to_s + (10 + rand * 90).to_i.to_s + (65 +rand(26)).chr + (65 +rand(26)).chr 
		end
		serial
	end
end
