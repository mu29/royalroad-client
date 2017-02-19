class Packet
	def self.get(line)
		case line
		when /<notice> (.*) <\/notice>/
			p "notice : #{$1}"
		when "\n"
			p "\\n is sended."
		end
	end

	def self.send(string)
		Server.socket.puts(string)
	end
end