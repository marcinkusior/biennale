class RegisterMail < ApplicationMailer

	# CONTEST REGISTRATION MAILS
	def register_success_mail(registration)

		@registration = registration
		
		mail.attachments['4thBiennial.pdf'] = File.read(File.join(Rails.root, 'app','pdfs','konkurs.pdf'))
		mail.attachments['4thBiennialForm.pdf'] = WickedPdf.new.pdf_from_string( render_to_string(:pdf => 'Form',:template => 'attachments/registration_success.pdf.erb'))

		mail(
			to: @registration.email,
			subject: "Registration in 4th Biennale INAW Contest" 
		 )

	end # end rgister_success_mail

	def backup_mail(registration)
		@registration = registration

		i= 1
		@registration.images.each do |image|
			mail.attachments["obrazek_#{i}"] = File.read( image.src.path )
			i = i+1
		end

		mail(
			to: 'inawbiennale@gmail.com',
			subject: "#{@registration.serial} #{@registration.first_name} #{@registration.last_name}" 
		 )
	end

####################################
	# CONFERENCE REGISTRATION MAILS
####################################
	def register_conference_success_mail(registration)
		@registration = registration

		pdf = locale == :en ? File.read(File.join(Rails.root, 'app','pdfs','konferencja.pdf')) : File.read(File.join(Rails.root, 'app','pdfs','konferencjaPL.pdf'))

		mail.attachments['4thBiennial.pdf'] = pdf
		mail.attachments['4thBiennialForm.pdf'] = WickedPdf.new.pdf_from_string( render_to_string(:pdf => 'Form',:template => 'attachments/registration_conference_success.pdf.erb'))

		mail(
			to: @registration.email,
			subject: "Registration in 4th Biennale INAW Conference",
		 )
	end



	def conference_backup_mail(registration)
		@registration = registration
			# ext = File.extname( @registration.attachment.path )
			# mail.attachments["#{@registration.first_name}_#{@registration.last_name}.#{ext}"] = File.read( @registration.attachment.path )

		mail(
			to: 'inawbiennale@gmail.com',
			subject: "konferencja #{@registration.first_name} #{@registration.last_name}" 
		 )
	end
end
