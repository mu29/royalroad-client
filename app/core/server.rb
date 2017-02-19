class Server
	def self.init
		# Enter to Server
		@socket = TCPSocket.new('127.0.0.1', 50000)
	end

	def self.update
    Thread.new {
      if line = @socket.gets
        Packet.get(line)
      end
      s.close
    }
	end

	def self.socket
		@socket
	end
end