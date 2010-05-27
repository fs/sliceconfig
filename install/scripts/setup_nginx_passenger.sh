# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# configure stub host
mkdir /etc/nginx/vhosts
copy_file $sliceconfig/config/etc/nginx/__0default.conf /etc/nginx/vhosts

# copy config
ngconf="/etc/nginx/nginx.conf"
copy_file $sliceconfig/config/etc/nginx/nginx_passenger.conf $ngconf

# create http auth

copy_file $sliceconfig/config/etc/nginx/auth.conf /etc/nginx/auth.conf
copy_file $sliceconfig/config/etc/nginx/htpasswd /etc/nginx/htpasswd

