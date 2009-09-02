# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/memcached-1.1.12-2.el4.rf.x86_64.rpm

