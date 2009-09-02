# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
copy_file $sliceconfig/config/etc/monit.d/memcached.conf /etc/monit.d/memcached.conf link


# reload monit
monit reload

