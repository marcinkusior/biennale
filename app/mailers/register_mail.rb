class RegisterMail < ApplicationMailer

	# CONTEST REGISTRATION MAILS
	def register_success_mail(registration)
		edition = General.first.edition_no.to_s;

		@registration = registration
		@settings = General.first

		mail.attachments[edition + 'thBiennial.pdf'] = contest_attachment if contest_attachment
		mail.attachments[edition + 'thBiennialForm.pdf'] = WickedPdf.new.pdf_from_string( render_to_string(
			pdf: 'Form',
			template: 'attachments/registration_success.pdf.erb'
		))

		mail(
			to: @registration.email,
			subject: "Registration in #{edition}th Biennale INAW Contest"
		 )
	end

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
		edition = General.first.edition_no.to_s;
		@registration = registration
		@settings = General.first

		mail.attachments[edition + 'thBiennial.pdf'] = conference_attachment if conference_attachment
		mail.attachments[edition + 'thBienialForm.pdf'] = WickedPdf.new.pdf_from_string( render_to_string(:pdf => 'Form',:template => 'attachments/registration_conference_success.pdf.erb'))

		mail(
			to: @registration.email,
			subject: "Registration in #{edition}th Biennale INAW Conference",
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

	def contest_attachment
		attachment = false
		if (locale == :en)
			return false unless General.first.contest_mail_attachment_url
			attachment_url = File.join(Rails.root, 'public', General.first.contest_mail_attachment_url);
			attachment = File.read(attachment_url) if File.exist?(attachment_url)
		else
			return false unless General.first.contest_mail_attachment_PL_url
			attachment_url = File.join(Rails.root, 'public', General.first.contest_mail_attachment_PL_url);
			attachment = File.read(attachment_url) if File.exist?(attachment_url)
		end
		return attachment
	end

	def conference_attachment
		attachment = false
		if (locale == :en)
			return false unless General.first.conference_mail_attachment_url
			attachment_url = File.join(Rails.root, 'public', General.first.conference_mail_attachment_url);
			attachment = File.read(attachment_url) if File.exist?(attachment_url)
		else
			return false unless General.first.conference_mail_attachment_PL_url
			attachment_url = File.join(Rails.root, 'public', General.first.conference_mail_attachment_PL_url);
			attachment = File.read(attachment_url) if File.exist?(attachment_url)
		end
		return attachment
	end
end
