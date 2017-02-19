=begin
This class is used to init our server.
Different args are available ( IP / Port / Refresh time )

This file is under GPLv3 License

Author : Gilles Dubois
=end

require 'socket'

class Server

  def initialize(ip, port, refresh_time)

    # Instance variables
    @srv_ip=ip
    @srv_port=port
    @src_refresh=refresh_time
    @continue = true

    # Server init
    @server = TCPServer.new(@srv_ip, @srv_port)
    Logging.print_log('Server successfully created')
    Logging.print_log('Waiting for connection ...')

    # Loop to wait connections
    loop do
      # Fork connection ( multi thread )
      Thread.fork(@server.accept) do |client|
        Logging.print_log("Connection received from #{client}")
        Logging.print_log('Prompt on remote client opened')
        @continue = true

        input = client.gets
        Logging.print_log("Client prolog : #{input}")

        # Loop for remote commands interpretor
        loop do

          if @continue
            Logging.print_log('Command to execute : ')
            command = gets.chomp
            Logging.print_log("Executing command #{command} on remote computer ...")
            client.puts(command)
            output = client.gets
            Logging.print_log("Command output is #{output}")
          end

          if command == 'exit'
            Logging.print_log('Closing remote connection ...')
            @continue = false
            client.close
            break
          end
        end

      end

    end

  end

end