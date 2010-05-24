#!/usr/bin/env ruby

def config
  raise ArgumentError if ARGV.empty?

  db_name = ARGV[0]
  db_host = ARGV[1] || 'localhost'  
  db_user = ARGV[2] || "prj_#{ARGV[0].gsub(/_(development|dev|staging|stage|production|prod)/, '')}"
  db_password = ARGV[3] || `apg -n 1 -a 0 -d`

  puts `mysql -e "CREATE DATABASE IF NOT EXISTS #{db_name}"`
  puts `mysql -e "GRANT ALL ON #{db_name}.* to \'#{db_user}\'@\'#{db_host}\' IDENTIFIED BY \'#{db_password}\'"`

  puts "Database: #{db_name}"
  puts "Host: #{db_host}"  
  puts "User: #{db_user}"
  puts "Password: #{db_password}"
end

begin
  config
rescue ArgumentError
  puts "Usage #{$0} db_name [db_host] [db_user] [db_password]"
end
