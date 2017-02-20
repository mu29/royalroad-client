# encoding: utf-8

class Packet
  def self.get(line)
    case line.force_encoding("utf-8")
    when /<notice> (.*) <\/notice>/
      p "notice : #{$1}"
    end
  end

  def self.send(string)
    Server.socket.puts(string)
  end
end