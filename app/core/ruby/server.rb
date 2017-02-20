class Server
	def self.init
		begin
			@socket = TCPSocket.new(*Config::SERVER)

		Thread.new {
			loop do
				begin
					if line = @socket.gets
						Packet.get(line)
					end
				rescue Errno::ECONNRESET
					p "Server is disconnected.", $!
					s.close
				end
			end
			p "!"
			s.close
		}

		rescue Errno::ECONNREFUSED
			p "Server is disconnected.", $!
			exit
		end

	end

	def self.update

	end

	def self.socket
		@socket
	end
end