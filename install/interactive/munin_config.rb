#!/usr/bin/env ruby
require 'erb'

MUNIN_CONFIG = '/etc/munin/munin.conf'

def config()
  if ARGV[0].nil?
    raise ArgumentError 
  end
  
  hostname = ARGV[0]

  ERB.new(template).result(binding)
end

def template
<<-END
[<%= hostname %>]
    address <%= hostname %>
    use_node_name yes
    sendmail_mailstats.rejected.warning 10
    sendmail_mailstats.discarded.warning 10
END
end

begin
  if ARGV[0] == '-a' || ARGV[0] == '--append'
    ARGV.shift
    File.open(MUNIN_CONFIG, 'a') { |file| file.write(config) }
  else
    puts(config)
  end
rescue ArgumentError
  puts "Usage: #{$0} [-a] {hostname}"
end