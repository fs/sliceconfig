# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy configs
copy_file $sliceconfig/config/etc/munin/plugins.conf /etc/munin/plugins.conf
copy_file $sliceconfig/config/etc/munin/munin-node.conf /etc/munin/munin-node.conf


# setup plugins
copy_file $sliceconfig/config/etc/munin/plugins/cpubyuser /etc/munin/plugins/cpubyuser
rm -f /etc/munin/plugins/iostat


# copy plugins conf
rm -f /etc/munin/plugin-conf.d/*
copy_file $sliceconfig/config/etc/munin/plugin-conf.d/cpubyuser /etc/munin/plugin-conf.d/cpubyuser
copy_file $sliceconfig/config/etc/munin/plugin-conf.d/sendmail /etc/munin/plugin-conf.d/cpubyuser


# configure service
chkconfig munin-node on


# restart service
service munin-node start
