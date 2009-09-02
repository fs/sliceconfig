# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link plugins
copy_file $sliceconfig/config/etc/munin/plugins/mysql_connections /etc/munin/plugins/mysql_connections link
copy_file $sliceconfig/config/etc/munin/plugins/mysql_qcache /etc/munin/plugins/mysql_qcache link
copy_file $sliceconfig/config/etc/munin/plugins/mysql_qcache_mem /etc/munin/plugins/mysql_qcache_mem link


# link plugins conf
copy_file $sliceconfig/config/etc/munin/plugin-conf.d/mysqld /etc/munin/plugin-conf.d/mysqld link


# restart service
service munin-node reload

