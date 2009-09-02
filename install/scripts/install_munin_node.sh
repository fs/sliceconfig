# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/munin-node-1.2.5-1.el5.rf.noarch.rpm $sliceconfig/install/files/perl-HTML-Tagset-3.20-1.el5.rf.noarch.rpm $sliceconfig/install/files/perl-Socket6-0.20-1.el5.rf.x86_64.rpm $sliceconfig/install/files/perl-Crypt-DES-2.05-3.2.el5.rf.x86_64.rpm $sliceconfig/install/files/perl-Net-Server-0.97-1.el5.rf.noarch.rpm $sliceconfig/install/files/perl-HTML-Parser-3.56-1.el5.rf.x86_64.rpm $sliceconfig/install/files/perl-Net-SNMP-5.2.0-1.2.el5.rf.noarch.rpm
