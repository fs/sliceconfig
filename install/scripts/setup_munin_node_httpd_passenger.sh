# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy plugins 
copy_file /usr/share/munin/plugins/apache_accesses /etc/munin/plugins/apache_accesses
copy_file /usr/share/munin/plugins/apache_processes /etc/munin/plugins/apache_processes
copy_file /usr/share/munin/plugins/apache_volume /etc/munin/plugins/apache_volume


# copy plugins conf
copy_file $sliceconfig/config/etc/munin/plugin-conf.d/httpd_passenger /etc/munin/plugin-conf.d/httpd_passenger


# restart service
service munin-node reload
