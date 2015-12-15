module PagesHelper

	def inline_svg(path)
    File.open("app/assets/images/#{path}", "rb") do |file|
	    raw file.read
	  end
	end

	def check_settings(parameter)
		General.first[parameter]
	end
end
