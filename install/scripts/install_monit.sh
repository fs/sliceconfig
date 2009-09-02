# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/monit-5.0_beta6-1.x86_64.rpm
