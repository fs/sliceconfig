#!/usr/bin/env ruby
require 'erb'

def config
  if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil? || ARGV[3].nil?
    raise ArgumentError 
  end

  domain        = ARGV[0]
  project_name  = ARGV[1]
  environment   = ARGV[2]
  port          = ARGV[3].to_i
  servers       = (ARGV[4] || 1).to_i
  only_www      = (ARGV[5] || 1).to_i == 1

  ERB.new(template).result(binding)
end

def template
<<-END
# this is where you define your mongrel clusters. 
# you need one of these blocks for each cluster
# and each one needs its own name to refer to it later.
upstream rails_<%= project_name %>_<%= environment %> {<% servers.times do |i| %>
  server localhost:<%= port + i %>;<% end %>
}
<% if only_www %>
server {
  server_name <%= domain %>;
  rewrite ^(.*)$ http://www.<%= domain %>$1 permanent;
}
<% end %>
# the server directive is nginx's virtual host directive.
server {
  # port to listen on. Can also be set to an IP:PORT
  listen 80;

  # Set the max size for file uploads to 50Mb
  client_max_body_size 50M;

  # sets the domain[s] that this vhost server requests for

  server_name www.<%= domain %> *.assets.<%= domain %><% unless only_www %> <%= domain %><% end %>;

  # doc root
  root /var/www/rails/<%= project_name %>/<%= environment %>/current/public;

  # vhost specific access log
  access_log  /var/log/nginx/<%= project_name %>.<%= environment %>.access.log  main;

  # slay down bots
  include /etc/nginx/bots.conf;

  location / {
    # serve assets with timestamp directly with max expires header
    if ($request_uri ~* "\\.(ico|css|js|gif|jpe?g|png)\\?[0-9]+$") {
      expires max;
      break;
    }
    
    # If the file exists as a static file serve it directly without
    # running all the other rewite tests on it
    if (-f $request_filename) {
      break;
    }
    
    # this rewrites all the requests to the maintenance.html
    # page if it exists in the doc root. This is for capistrano's
    # disable web task
    if (-f $document_root/system/maintenance.html) {
      rewrite  ^(.*)$  /system/maintenance.html last;
      break;
    }

    # needed to forward user's IP address to rails
    proxy_set_header  X-Real-IP  $remote_addr;

    # needed for HTTPS
    proxy_set_header  X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header "ENABLE_X_ACCEL_REDIRECT" "true";
    proxy_redirect false;
    proxy_max_temp_file_size 0;

    # check for index.html for directory index
    # if its there on the filesystem then rewite 
    # the url to add /index.html to the end of it
    # and then break to send it to the next config rules.
    #if (-f $request_filename/index.html) {
    #  rewrite (.*) $1/index.html break;
    #}

    # this is the meat of the rails page caching config
    # it adds .html to the end of the url and then checks
    # the filesystem for that file. If it exists, then we
    # rewite the url to have explicit .html on the end 
    # and then send it on its way to the next config rule.
    # if there is no file on the fs then it sets all the 
    # necessary headers and proxies to our upstream mongrels
    #if (-f $request_filename.html) {
    #  rewrite (.*) $1.html break;
    #}

    if (!-f $request_filename) {
      proxy_pass http://rails_<%= project_name %>_<%= environment %>;
      break;
    }
  }

  error_page   500  /500.html;
  error_page   502 503 504  /50x.html;
  location = /500.html {
    root   /var/www/rails/<%= project_name %>/<%= environment %>/current/public;
  }
  location = /50x.html {
    root   /var/www/rails/<%= project_name %>/<%= environment %>/current/public;
  }
}
END
end

begin
  puts(config)
rescue ArgumentError
  puts "Usage: #{$0} {domain} {project} {environment} {port} [servers=1] [only_www=1]"
end
