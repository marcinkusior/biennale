

class ArchiveExtractor
	require 'rubygems'
	require 'zip'

	def self.extract_file(zip_name)
		Zip::File.open(zip_name) do |zip_file|
			#creating folder for images
	    filename = zip_name.chomp(File.extname(zip_name))
	    Dir.mkdir filename unless Dir.exists?(filename)
		  zip_file.each do |entry|
		  	entry.name = entry.name.encode('UTF-8', {:invalid => :replace, :undef => :replace, :replace => '?'})

		  	unless entry.name.include?('MACOSX') || File.exists?(filename+'/'+ entry.name) then
			    puts "Extracting #{entry.name}"
			    entry.extract(filename+'/'+entry.name)
			  end
		  end
		end
	end
end

puts 'Enter Archive Name:'
archive_name = gets.chomp
zip_files_names = Dir.entries(archive_name).select{|e| File.extname(e) == '.zip' }

zip_files_names.each do |zipfile_name|
	ArchiveExtractor.extract_file(archive_name+'/'+zipfile_name)
end



