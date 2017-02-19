=begin
Main script file

Possible args :
-h => ip of the server
-p => port of the server
-r => refresh rate of the server

This file is under GPLv3 License

Author : Gilles Dubois
=end

require './class/logging'
require './class/server'

Logging.print_sep
Logging.print_log('The following configuration will be used : ')
Logging.print_sep
argments = Logging.init_arg_parse
Logging.print_sep
Logging.print_log("Creating server on #{argments[:host]}:#{argments[:port]}")
Server.new(argments[:host],argments[:port],argments[:rate])
Logging.print_sep
Logging.print_log('Shutdown server ...')
Logging.print_sep