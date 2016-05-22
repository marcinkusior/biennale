class PagesController < ApplicationController

	before_action :find_page
	before_action :block, :except => :inactive

	def Biennial
		partners = Partner.all.order(id: :desc)
		@honor_partners = partners.where(kind: 'honor')[0]
		@media_partners = partners.where(kind: 'media')[0]
		@partners = partners.where(kind: 'normal')[0]
		@organizers = partners.where(kind: 'organizer')[0]
	end

	def Program
	end

	def Conference
		@archives = Archive.all.order(id: :desc)
	end

	def Contest
		gallery_archive_id = General.first.contest_archive_id
		@archives = ContestArchive.where.not(id: gallery_archive_id).order(id: :desc)
		@gallery_archive = ContestArchive.find(gallery_archive_id) unless gallery_archive_id.blank?
		@gallery_archive_ids = @gallery_archive.contest_records.map{|record| record.id} unless gallery_archive_id.blank?

		# gathering results
		total = Vote.all.length.to_f
		if General.first.contest_archive_id != nil
			@results = [];
			@gallery_archive.contest_records.each do |record|
				@results << [record.serial, (record.votes.length / total * 100).round(1), record.votes.length] if record.votes.length > 0
			end

			@results.sort!{ |a, b| b[1] <=> a[1] }
		end
	end

	def Contact
		@newsaddresse = Newsaddresse.new
		@center = Marker.find( General.first.marker_id )
		@zoom = General.first.map_zoom
	end

	def Terms_Contest
	end

	def Terms_Conference
	end

	def Privacy
	end

	def Cookies
	end

	def inactive

	end

	def instruction
		pdf_filename = locale == :en ? File.join(Rails.root, 'app','pdfs','wytyczne.pdf') : File.join(Rails.root, 'app','pdfs','wytycznePL.pdf')
		send_file(pdf_filename, :filename => "ConferenceReq.pdf", :disposition => 'inline', :type => "application/pdf")
	end

	private

	def find_page
		@page = Page.find_by slug: action_name
	end

end
