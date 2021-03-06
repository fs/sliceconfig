# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy plugins 
copy_file $sliceconfig/config/etc/munin/plugins/nginx_status /etc/munin/plugins/nginx_status
copy_file $sliceconfig/config/etc/munin/plugins/nginx_request /etc/munin/plugins/nginx_requests


# copy plugins conf
copy_file $sliceconfig/config/etc/munin/plugin-conf.d/nginx /etc/munin/plugin-conf.d/nginx


# restart service
service munin-node reload
