# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/sysconfig/memcached /etc/sysconfig/memcached


# configure service
chkconfig memcached on

# add pid dir
mkdir /var/run/memcached
chown nobody /var/run/memcached

# reload service
service memcached restart

