# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link plugins 
copy_file /usr/share/munin/plugins/apache_accesses /etc/munin/plugins/apache_accesses link
copy_file /usr/share/munin/plugins/apache_processes /etc/munin/plugins/apache_processes link
copy_file /usr/share/munin/plugins/apache_volume /etc/munin/plugins/apache_volume link


# link plugins conf
copy_file $sliceconfig/config/etc/munin/plugin-conf.d/httpd /etc/munin/plugin-conf.d/httpd link


# restart service
service munin-node reload
