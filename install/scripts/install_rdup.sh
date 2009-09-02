# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/perl-Config-IniFiles-2.39-1.2.el5.rf.noarch.rpm $sliceconfig/install/files/perl-Unix-Syslog-1.0-1.el5.rf.x86_64.rpm $sliceconfig/install/files/rdup-0.6.0-1.el5.rf.x86_64.rpm
