# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


yum -y -d1 install iptables.x86_64 logrotate.x86_64 perl-DateManip.noarch
yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/rkhunter-1.3.2-4.el5.noarch.rpm $sliceconfig/install/files/apg-2.3.0b-5.el5.x86_64.rpm

