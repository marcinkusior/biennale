








namespace :archive do 
  desc "TODO"
  task add_to_archive: :environment do
  	archive_folder = '3edition'
  	archive_name = 'Archiwum'


  	# Folders names will become names of records
  	folders_names = Dir.entries(File.join(Rails.root, 'contest_archive', archive_folder)).select{|name| File.extname(name) != '.zip' && name.length>5 }

  	archive = ContestArchive.where(title: archive_name).take
  	
  	folders_names.each do |folder_name|
  		# do not create record if one with the same name already exists
  		unless archive.contest_records.to_a.any?{|record| record.title == folder_name }
	  		record = archive.contest_records.build(title: folder_name, titlePL: folder_name)

	  		#find all the images inside of the folder then add iamges to records
	  		images_names = Dir.entries(File.join(Rails.root, 'contest_archive', archive_folder, folder_name)).select{|name| File.extname(name) == '.jpg' }

	  		images_names.each do |image_name|
	  			path = File.join(Rails.root, 'contest_archive', archive_folder, folder_name, image_name)
	  			record.public_images.build(src: File.open(path))
	  		end
	  		record.save
  		end
  	end

  end

end
