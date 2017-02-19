=begin
This class is used to manage all log / debug from the server of our backdoor

This file is under GPLv3 License

Author : Gilles Dubois
=end

require 'time'
require 'optparse'

class Logging

  @@separator_length = 40

  def self.print_log(phrase)
    string = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    string += ' : '
    string += phrase

    puts string
  end

  def self.print_sep
    separator = ''

    i = 0
    until i == @@separator_length
      separator += '='
      i += 1
    end

    puts separator
  end

  def self.init_arg_parse

    args = {}

    OptionParser.new do |opts|
      opts.banner = <<-EOS
        Usage : 
          -h : Server ip address or hostname
          -p : Server port
          -r : Server refresh rate ( in seconds )
      EOS

      opts.on('-h h') do |host|
        args[:host] = host
        Logging.print_log("Hostname / ip set to #{host}")
      end

      opts.on('-p p') do |port|
        args[:port] = port
        Logging.print_log("Port set to #{port}")
      end

      opts.on('-r r') do |rate|
        args[:rate] = rate
        Logging.print_log("Refresh rate set to #{rate}")
      end

    end.parse!

    return args

  end

end