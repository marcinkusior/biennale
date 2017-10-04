class ArchiveMaker
	require 'rubygems'
	require 'zip'

	def self.extract_file(zip_name)
		Zip::File.open(zip_name) do |zip_file|
			i = 0
			dest_file = 'entry'
			#creating folder for images
	    filename = File.basename(zip_name,File.extname(zip_name))
	    Dir.mkdir filename unless Dir.exists?(filename)
		  zip_file.each do |entry|
		  	i+=1
		  	#extracting images to created folder
		  	unless entry.name.include?('MACOSX') || File.exists?(filename+'/'+ entry.name) then
			    puts "Extracting #{entry.name}"
			    entry.extract(filename+'/'+ entry.name)
			  end
		  end
		end
	end
end

archive_name = gets.chomp
puts Dir.entries(archive_name)

# ArchiveMaker.extract_file(zipfile_name)
