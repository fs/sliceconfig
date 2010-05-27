# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/sysconfig/iptables /etc/sysconfig/iptables
copy_file $sliceconfig/config/etc/sysconfig/iptables-config /etc/sysconfig/iptables-config

# configure service
chkconfig iptables on


# restart service
service iptables restart
