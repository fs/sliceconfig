#!/usr/bin/env ruby
require 'erb'

def config
  if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil?
    raise ArgumentError 
  end

  domain        = ARGV[0].gsub(/^www\./, '')
  project_name  = ARGV[1]
  environment   = ARGV[2]
  port          = (ARGV[3] || 8080).to_i
  only_www      = (ARGV[4] || 1).to_i == 1

  ERB.new(template).result(binding)
end

def template
<<-END
<VirtualHost *:<%= port %>>
  ServerAdmin webmaster@<%= domain %>
  ServerName www.<%= domain %>
  <% unless only_www %>ServerAlias <%= domain %>
  <% end %>
  RailsBaseURI /
  RailsEnv <%= environment %>
 
  DocumentRoot /var/www/rails/<%= project_name %>/<%= environment %>/current/public
  CustomLog /var/log/httpd/<%= project_name %>.<%= environment %>.access_log common
</VirtualHost>
END
end

begin
  puts(config)
rescue ArgumentError
  puts "Usage: #{$0} {domain} {project} {environment} [port=8080] [only_www=1]"
end