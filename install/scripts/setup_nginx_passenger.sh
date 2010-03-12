# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# configure stub host
mkdir /etc/nginx/vhosts
copy_file $sliceconfig/config/etc/nginx/__0default.conf /etc/nginx/vhosts link

# link config
ngconf="/etc/nginx/nginx.conf"
copy_file $sliceconfig/config/etc/nginx/nginx_passenger.conf $ngconf link

# create http auth

copy_file $sliceconfig/config/etc/nginx/auth.conf /etc/nginx/auth.conf link
copy_file $sliceconfig/config/etc/nginx/htpasswd /etc/nginx/htpasswd link

