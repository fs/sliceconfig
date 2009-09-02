# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/htop-0.7-1.el5.rf.x86_64.rpm