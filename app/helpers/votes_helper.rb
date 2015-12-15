module VotesHelper

	def unique_ip(ip)
		votes = []
		Vote.all.each{|vote| votes << vote.ip_address }
		votes.find_index(ip) == nil
	end

end
